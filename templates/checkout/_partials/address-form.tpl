{extends file='customer/_partials/address-form.tpl'}

{block name='form_field'}
  {if $field.name eq "alias"}
    {* we don't ask for alias here *}
  {else}
    {$smarty.block.parent}
  {/if}
{/block}

{block name='form_fields' append}
  <input type="hidden" name="saveAddress" value="{$type}">
  {if $type === "delivery"}
    <label>
      <input  name    = "use_same_address"
              type    = "checkbox"
              value   = "1"
              {if $use_same_address} checked {/if}
      >
      <span>{l s='Use this address for invoice too' d='Shop.Theme.Checkout'}</span>
    </label>
  {/if}
{/block}

{block name='form_buttons'}
  {if !$form_has_continue_button}
    <a href="?cancelAddress={$type}">{l s='Cancel' d='Shop.Theme.Actions'}</a>
    <button type="submit" class="btn btn-default">{l s='Save Address' d='Shop.Theme.Actions'}</button>
  {else}
    {if $customer.addresses|count > 0}
      <a href="?cancelAddress={$type}" class="btn btn-default">{l s='Cancel' d='Shop.Theme.Actions'}</a>
    {/if}
    <button type="submit" class="continue btn btn-primary" name="confirm-addresses" value="1">
      {l s='Continue' d='Shop.Theme.Actions'}
    </button>
  {/if}
{/block}

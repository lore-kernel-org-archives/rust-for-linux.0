Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF39420E7D
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783438979; cv=none; b=H5QyzpfOPjg0ZO3kFdAx9Ke6JXsOpphTzWqHtVkH/Z0bKqxXfwIvRj89Cv/5tFnUKrW67V6LNwDA4+b+AsIFRIvm40iHOzjOUXb2SvFugjtL6p7dfYZoO/nOIG64S7VIMXLxDWl3gU15uPqz35Bw41MndfZhrlE8OPtz2OaK36c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783438979; c=relaxed/simple;
	bh=IpnuqxAzX5Jk9D9UTRTGzsRu536usqYEhQa8g0NzTV4=;
	h=Message-ID:Date:From:To:CC:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nhtyhLZnnJ/eSNliPh+Kq4rXxlg0EDotA1D/W5IFohulFKT6PzJOGK/MctQSxfChaR9z3hxUPDbfoviMqG1B4O4GJJZdyhhZDP0OMhEyHEul2YqcrIZQPFGZoOiuXcTRnQZOSQrMoHzi+FeEAwh4P/tL5vko7x3zOrwRZd75dNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=UCD8wXIU; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="UCD8wXIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1783438970;
	bh=acS2QV8s8rct3hqWGlZKsa56vtawDiailCkTBo8IjXM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=UCD8wXIUxeB2bqKpTeFpm1cefh/VmVqUxdnudxdxfXBAHjRLjHNimGCMM1bVPYxtU
	 ZkeNYglhf6vG/QNJIO298CSdtYar8hHo+8nG4PwdcyJjg64ZQiNQzxT3EP9NYwm7ji
	 hijRN+aqzLi7gYshjBv3nzPMT8Jlcl6w6L/fc4c4=
Received: from ehlo.thunderbird.net ([42.102.213.150])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id AB0812F9; Tue, 07 Jul 2026 23:42:48 +0800
X-QQ-mid: xmsmtpt1783438968t0fz13z1x
Message-ID: <tencent_27A9C09D053F6737E1C90B4D166C426C2E08@qq.com>
X-QQ-XMAILINFO: M2SvzgchpLqfLbm73g8NISQ2qfrEDU8q/eJ/K8levicbYLNqWNHd4b1OP9SNoi
	 IIC3QPC2J7s4E8n/VdEUGMcXvA1ZHZ8lfFmSQS4TFIdMZAbvlR5qO689je/E7LNj0eqh5Ewvqm4+
	 Cg5L1nQO6GTBCpeQbIRMCHbSpTA0LP7amnRsb7txoHZnDrCo+pIq9BJTvCnjNm8xnXI4Xm5WQuWM
	 RReS/b3tuPg+9UOWuRrhSXQ7IPQL4TZ0qacOAxKD3lqjKt0oDVi+FraAi+2bblTI3lV0MZzjd7Vm
	 U6XCQ6H4ktTLyi+eDMBYYfuIbkIylXvwVRN4A/UJ9Ocby8lqZ8bGmSF1poa8OvEp2QD2bYM8toTA
	 ly8JflYl5TMkUW3CAssfBzLEp6JFaLWjAFVZ24eE43+PXornM0q/fMpgn4E+GP6KUaQi8fHrE4bD
	 nFpU8/obXNkHGPkvPfI3LcowkbcRl/02YZFFQWLnHaN8FEOP2JgK8cm1BEcPwfJ2yhcdy/wotEhv
	 vwBtSxpdCPTk2z/4lglpGa3MOMnXiRZQRAliU0AFBIMRj7FxV+QfkWsD6RCT/hFFVoNON4h9VQvg
	 9Ap+y5XmFTztizBjYpHtVgYgo/zs6ctEgzgiP2kyBWq5BTGmCvetN+wcfA7yrUFZV2v2YP4p8/tW
	 N6Pg85QNg9uJibSZXT2ZUfoC1js2n39/bH6dqD+F+dPcXjNkqrRLzhhb/n3UMVtfGl4KDnNW56nd
	 H6kqpUj0x8iY9x89+qrrlhrj6XQJwy34VUbW0DormC5DWKaJcUtyVrMCGXADxNOMRzBAbQXa/Kls
	 7J6XcYTY8GVY/XqOAZvvnrEdGyIx4LfKHemn9ELH5gFADov6Ah22Wqz5aM/EVIl38sPiqPiwk5Pm
	 gXPJ+joOkalqeWhIPW1T4NaGKyRbynLRU4iIbBMHm2UCNg2bEB41V/9Pzi9k34S+EpBGg1cKT44c
	 UZJmcWr27k5t3HCLqMOakHXYfue8sbDrUNvA2hZ0fmQzydd6foRzpaNYZk07mchxdE7BJUwhezC3
	 +BgtlaR9iUH6AvUTotes9/vZFiHMTdO00fuHhC59/yVuxWGuB2
X-QQ-XMRINFO: MSVp+SPm3vtS54gIafhEfwphsf+XmkU59A==
Date: Tue, 07 Jul 2026 15:42:46 +0000
From: Pengheng Wang <pengheng.wang@foxmail.com>
To: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org
CC: ojeda@kernel.org, lossin@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_rust=3A_pin-init=3A_Add_missi?=
 =?US-ASCII?Q?ng_SAFETY_comments_in_internal/init=2Ers?=
In-Reply-To: <DJSDH6ZWWQI4.14UJGH8YGO95U@garyguo.net>
References: <tencent_847C6CC7A95F9DB83F0D371CC97F4DD46C08@qq.com> <DJSDH6ZWWQI4.14UJGH8YGO95U@garyguo.net>
X-OQ-MSGID: <2ECA4B7E-49C4-411F-9800-62DFCA464B43@foxmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you for taking time to check my email=2E I'll rebase on the latest co=
de and update the remaining SAFETY comments accordingly=2E Many thanks for =
your valuable feedback on my draft =E2=80=93 your guidance is much apprecia=
ted=2E I'll prepare a respin and address all the points raised=2E

Sincerely,
Wang

On 2026=E5=B9=B47=E6=9C=887=E6=97=A5 UTC 13:27:40=EF=BC=8CGary Guo <gary@g=
aryguo=2Enet> Wrote=EF=BC=9A
>On Fri Apr 3, 2026 at 12:52 PM BST, Pengheng Wang wrote:
>> Replace "// SAFETY: TODO" placeholders with proper safety explanations
>> for the unsafe blocks in the proc-macro initialization code=2E
>
>This patch doesn't apply anymore, due to the refactoring to the slots=2E =
There're
>still 3 TODOs left=2E Want to do a respin?
>
>>
>> Each unsafe block now has a clear explanation of why the operation is
>> safe:
>>
>> - Line 152: Type implements HasPinData/HasInitData trait guaranteeing
>>   correct data structure for field initialization
>> - Line 175: Closure correctly initializes all fields and handles
>>   errors/panics properly
>> - Lines 255, 261, 269, 297, 315: slot pointer validity and proper
>>   alignment guarantees for field access and projection
>
>We don't need to repeat what the diff is already telling in the commit me=
ssage=2E
>
>Best,
>Gary
>
>>
>> Suggested-by: https://github=2Ecom/Rust-for-Linux/linux/issues/351
>> Link: https://github=2Ecom/Rust-for-Linux/linux/issues/351
>> Signed-off-by: Pengheng Wang <pengheng=2Ewang@foxmail=2Ecom>
>> ---
>>  rust/pin-init/internal/src/init=2Ers | 19 ++++++++++++-------
>>  1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/rust/pin-init/internal/src/init=2Ers b/rust/pin-init/inter=
nal/src/init=2Ers
>> index 2fe918f4d82a=2E=2E4121e21e01e1 100644
>> --- a/rust/pin-init/internal/src/init=2Ers
>> +++ b/rust/pin-init/internal/src/init=2Ers
>> @@ -149,7 +149,8 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *m=
ut T)
>>      let field_check =3D make_field_check(&fields, init_kind, &path);
>>      Ok(quote! {{
>>          // Get the data about fields from the supplied type=2E
>> -        // SAFETY: TODO
>> +        // SAFETY: The type implements `#has_data_trait`, guaranteeing=
 that `#get_data` returns the
>> +        // correct `#data_trait` type for initializing the struct's fi=
elds=2E
>>          let #data =3D unsafe {
>>              use ::pin_init::__internal::#has_data_trait;
>>              // Can't use `<#path as #has_data_trait>::#get_data`, sinc=
e the user is able to omit
>> @@ -171,7 +172,8 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *m=
ut T)
>>          let init =3D move |slot| -> ::core::result::Result<(), #error>=
 {
>>              init(slot)=2Emap(|__InitOk| ())
>>          };
>> -        // SAFETY: TODO
>> +        // SAFETY: the closure passed to `#init_from_closure` correctl=
y initializes all fields of the
>> +        // struct and returns `Ok(())` on success; it handles errors/p=
anics correctly=2E
>>          let init =3D unsafe { ::pin_init::#init_from_closure::<_, #err=
or>(init) };
>>          init
>>      }})
>> @@ -250,12 +252,13 @@ fn init_fields(
>>                  let accessor =3D if pinned {
>>                      let project_ident =3D format_ident!("__project_{id=
ent}");
>>                      quote! {
>> -                        // SAFETY: TODO
>> +                        // SAFETY: `slot` is a valid pointer to the st=
ruct being initialized, and `#data`
>> +                        // provides the correct projection function th=
rough the `#project_ident` method=2E
>>                          unsafe { #data=2E#project_ident(&mut (*#slot)=
=2E#ident) }
>>                      }
>>                  } else {
>>                      quote! {
>> -                        // SAFETY: TODO
>> +                        // SAFETY: `slot` is a valid pointer to the st=
ruct being initialized=2E
>>                          unsafe { &mut (*#slot)=2E#ident }
>>                      }
>>                  };
>> @@ -263,7 +266,8 @@ fn init_fields(
>>                      #(#attrs)*
>>                      {
>>                          #value_prep
>> -                        // SAFETY: TODO
>> +                        // SAFETY: `slot` is a valid pointer to the st=
ruct being initialized, and the
>> +                        // field is properly aligned (enforced by the =
field accessor)=2E
>>                          unsafe { #write(::core::ptr::addr_of_mut!((*#s=
lot)=2E#ident), #value_ident) };
>>                      }
>>                      #(#cfgs)*
>> @@ -290,7 +294,8 @@ fn init_fields(
>>                              unsafe { #data=2E#ident(::core::ptr::addr_=
of_mut!((*#slot)=2E#ident), #init)? };
>>                          },
>>                          quote! {
>> -                            // SAFETY: TODO
>> +                            // SAFETY: `slot` is a valid pointer to th=
e struct being initialized, and `#data`
>> +                            // provides the correct projection functio=
n through the `#project_ident` method=2E
>>                              unsafe { #data=2E#project_ident(&mut (*#sl=
ot)=2E#ident) }
>>                          },
>>                      )
>> @@ -307,7 +312,7 @@ fn init_fields(
>>                              };
>>                          },
>>                          quote! {
>> -                            // SAFETY: TODO
>> +                            // SAFETY: `slot` is a valid pointer to th=
e struct being initialized=2E
>>                              unsafe { &mut (*#slot)=2E#ident }
>>                          },
>>                      )
>


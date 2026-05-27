Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C5B3E2ACA
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779879034; cv=pass; b=Rdl5iMDWBUlyEi7ygiSFb9yehTUG6StJb+y5ciNzyqxFwOOfdjLH4dd15vaOg1efGu+O+MJDMizIc5Dd4052IKp3HBUa5s3TgjyQfwdfTzY4YDMTtWN+9f3z0yb0QKm3rqAvVltjcQ+dzpbkC1JK9IJHLhoqXxETj2Ljt4j4SeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779879034; c=relaxed/simple;
	bh=7vx9xZqjCFLCXM5nhBfGFLzh36a8UcivtARewAhcNvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJ5eRjqJI5dtwkg5J8LwW0t1RsLqPaVaXXu5gF3fY6hTQqQ26E5KEi12gdg59jw1Ik4Bo8fWon165v7S5PDYF4Xg8J8vwDbe0HmTU16JuAyQkMMR8+R3/KopWT3/jingjK+I3mSDZNcNk52IWKXy1C2hc8hGFCl5y8xBN0gjuPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqfEB7RF; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqfEB7RF"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7dbd25309f7so759057b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 03:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779879028; cv=none;
        d=google.com; s=arc-20240605;
        b=VQwCirFXODVMqntr4Q+uYitlB1zAdeEdQdOpMoMF9WXHfof0LLk3Wf+tsllfbWeGBu
         JMZI6ljiGbv41JLLjIWz7kv6J/OfY5wsZwPKyGmWHuYcaVGYBgj2lzAfenfdxiDJrRMg
         ZPiIZhczooRsAYYDfy+pdiYspuEc2cf0cmAIIpRKsZEZF2omnCccM2C0PuCOKG0FL5nF
         SG8uyqtAoAJE44y35WMcTkyBoUoDSGZP0Xqk9sNG+8HclFb5LW8yzpLqSELq5p5mkYEG
         MB8DTAqLFdIVu3uLbvivKemHa5qShaW4xlis2mH3PJdOccMxuyRJbAOz02teIIBcMW85
         4nwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Pxh/J9+mLrAuN6nVCrsXJhd8gFCsAnbAZtQpaxHM18=;
        fh=w15cwVi4rF/6wJZ2bgK3qOCE9qvuQGE+PEjWSDvCdI0=;
        b=CcHLngOyY5h34FUo3poHLHBFC04hs/qB8ykSlltptCQFiBYeRT84BdKyJ5SSXXL2ue
         cRnVScd8dDbUvwggeHELhIAAO7JW+CvPL5hlR+cAjzQ++eTx+JwgUPXaoU3PC2Hlf0LM
         /PwamWbNcqm7qqMNTqzltm1iEPfY48zqBdAnwhWHVnTvuMq8bl9/G3jAKqos8WOMVxJk
         ldXENNdXBMyti1U98NTuAp/wxzRa2ewjs/clqRsI9arl+kaGjK0nRkmCrQNCdTfxc4Z8
         gJwiRKZNKde8ZLfPWnJIury890VaBQ+FkKDmSjSICsOgzu1DbH1AXNsZ4W0SWlDLInkp
         j2Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779879028; x=1780483828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Pxh/J9+mLrAuN6nVCrsXJhd8gFCsAnbAZtQpaxHM18=;
        b=bqfEB7RFdJEv3P4hOei74fQc66jUJNr5ozo0QlXBHmn9oSzwjWPUdclFQAG2+/dKjB
         ouEMHbwBGcK7dmSWyd4HUViHvMiZqkxKppP8tZnuSeARq2I6I2KUa7ZOKafUdTBwEzCF
         2GuFnYHJ4uRPq+PPXMZOOINCHqarnSB9IUC8mUrm2Nv6767uN6cQ25D4bpl8XXSNGHgX
         yBvcmF46PhvJYOFZK2YYbTFbAGK3VXYcqUbbTTPpr1oUD+AH0dWhJt3esICJucTsyrzx
         ipD+LiPXzpLujVyt7upaYG8tE7lj4lET9uRv1HbSehX2evPm/8OjU7R59k08Pn1j2v5b
         W84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779879028; x=1780483828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Pxh/J9+mLrAuN6nVCrsXJhd8gFCsAnbAZtQpaxHM18=;
        b=Up9eCqsbY531/u7SaC7UbnqDJTZ59rhz5S+c54E2XOTdQIenAyj97vX0krPPlRMeBD
         YUaJZMYcrIupvdOTUa0c6u8h3Cs49oqPHuMAEsEFpXxP0Txp7AGVMrKDQ5wQr9iEKIoZ
         57KTza+LrWMBwMjiTgQe+v8/tjb4uz5+sE3C+TYASuLu8mE6CIZT3cNBXyfMO0r+xIcv
         NsYnNx6PK552/rN3yxh1r99r2IMl1fNUAMUcYnaRlwjF9PTmkwIxLfvWogfcTsMvhp09
         1Kd3JhpPlWuhRdnRfA81CQ62Ornld2A0xYS8RaU55Oa9We8+HIdek/2ZDXk/c6+zVAE0
         Ptwg==
X-Forwarded-Encrypted: i=1; AFNElJ9Qi2obei9D50VedRpcTag98RVsZ6EvM1A28VFcuHpTE8Kk7/EtdCyM3u3ABi4NnC0Ymh/+zQcXCCwdtzkxQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUgaTnWGloCRSj+NIOkxZeZaCQ4uu21w0PsnTnsY6EPp4RL4ua
	6wKmdVGsRwqOVLPfJJk7DP2T8HkFGsv7kvwROP/tVmXaUmrGHIZUC+pekIz7iOFa7my9j+KM1/I
	EQ8XJ9Amrxit0OQW3OkGupv/1DMVJk+c=
X-Gm-Gg: Acq92OETijhI8JBWDeEYI0n4G3O/oSLfo9VI3dwoJix72lXpSw/q2KPs+XVhx8KLZGh
	2+csdns/+j4lXcaI2lE6aPIhJT4QlULKuqj8A7hdEsoLV8UAdOhlreplgRyED6k+5EIAc0bm+QI
	bsxI8z2lvXsBnvvK3H561bFteFwcu4jf3ECF30ihMyyU5p0QUdvMSwEkgWNWKVouIzVxOKEu2Ue
	Kk9bJ2P63apaJJgDZ0hiesSetg0DT67x3GHqLBIwxKC4Fj10q0ciaWFMsf46dOR+s+5EwP4el8v
	fVxw/Vf4eP/vUY6UrLS9H9N7CZ+FL6D20YtkXL+U/jCL3zUS07YevmxEITzxGPI+U1BK0Opz
X-Received: by 2002:a05:690c:4b0a:b0:7bf:107b:f859 with SMTP id
 00721157ae682-7d338682c40mr250242047b3.16.1779879028045; Wed, 27 May 2026
 03:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526094329.533943-1-kingeaary@gmail.com> <20260526115825.1480768-1-kingeaary@gmail.com>
 <2026052607-underhand-mauve-dcaa@gregkh>
In-Reply-To: <2026052607-underhand-mauve-dcaa@gregkh>
From: Aary Kinge <kingeaary@gmail.com>
Date: Wed, 27 May 2026 16:20:17 +0530
X-Gm-Features: AVHnY4LNhHI0kJUx3iIl33o2QoGAptmFf0tnYg8aG2ZJkwKyI9p19MOgm6cK-U0
Message-ID: <CAEb4iH_NMox9q0yjtC+R8Y9fSRZzGZJvwKS4+vXzC0CYen7zyA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: devres: optimize type name allocation and fix truncation
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 4:13=E2=80=AFPM Aary Kinge <kingeaary@gmail.com> wr=
ote:
>
>
> Hi Miguel,
>
> On Tue, May 26, 2026 at 6:07=E2=80=AFPM Miguel Ojeda <miguel.ojeda.sandon=
is@gmail.com> wrote:
>>
>> On Tue, May 26, 2026 at 1:58=E2=80=AFPM Aary Milind Kinge <kingeaary@gma=
il.com> wrote:
>> >
>> > The unconditional 128-byte const array allocation for every unique
>> > `Devres<T>` caused unnecessary .rodata bloat in production builds,
>>
>> Wasn't the string deduplicated?
>>
>
> You are right. The original string was identical for all T and would be d=
eduplicated by the linker.
> I will reword the commit message to focus on the actual improvement: repl=
acing the generic placeholder with the real type name
>
>>
>> > terminator), the copy routine now appends "..." at the end =E2=80=94 c=
opying
>>
>> Did an LLM assist this patch? If so, please add a tag:
>
>
> Yes. I will add the appropriate tag in v3.
>
>>
>>
>>   https://docs.kernel.org/process/generated-content.html
>>   https://docs.kernel.org/process/coding-assistants.html
>>
>> Moreover, this should be sent to the right maintainers and reviewers,
>> e.g. at least to "DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS". Cc'ing
>> them here, but also please Cc all the "RUST" entry.
>
>
> Yes, I will CC the right maintainers.
>
>>
>>
>> > +        let mut buf =3D [0u8; 128];
>>
>> Why is there a hardcoded literal? Please use constants where possible,
>> deriving the rest of the literals from that.
>
>
> I will replace the hardcoded values with derived constants in v3.
>
>>
>>
>> > +        let mut len =3D 0;
>> > +        while len < 128 && static_buf[len] !=3D 0 {
>> > +            len +=3D 1;
>> > +        }
>> > +
>> > +        // SAFETY: `static_buf` is promoted to static memory, and we =
verified the null byte.
>>
>> This should explain why this is all OK, e.g. why it doesn't go out of
>> bounds (a local-only reading of the loop above would appear to make it
>> so).
>
>
> Understood. I will improve the SAFETY comment and see if the unsafe can
> be avoided entirely.
>
>>
>>
>> Or avoid `unsafe` altogether if possible.
>>
>> > +    #[cfg(not(CONFIG_DEBUG_DEVRES))]
>> > +    const TYPE_NAME_CSTR: &'static crate::str::CStr =3D crate::c_str!=
("");
>>
>> Is the name not used at all under `!CONFIG_DEBUG_DEVRES`?
>>
>> Either way, could we move the other `const`s inside this one, and
>> remove the `cfg` here? i.e. reducing the number of conditional items
>> and avoiding to repeat the "signature" of this `const`.
>
>
> Yes, I will restructure this in v3.
>
> I dug into this and it turns out it is used. The naming is misleading =E2=
=80=94 devres_set_node_dbginfo() stores node->name unconditionally, and the=
 trace_devres_log() tracepoint in drivers/base/trace.h records it unconditi=
onally too. The only thing gated behind CONFIG_DEBUG_DEVRES is the devres_d=
bg() printk, not the tracepoint.
>
> So if I gate the real type name behind CONFIG_DEBUG_DEVRES, the devres tr=
acepoints show an empty string in production traces for every Rust Devres<T=
> =E2=80=94 which is worse than the generic "Devres<T>" placeholder we had =
before. The correct approach is to just always provide the real type name. =
The overhead is negligible (a single const array per monomorphization of De=
vres<T>).
>
> That means I should drop the #[cfg] gating entirely on TYPE_NAME_CSTR and=
 remove the #[cfg(not(CONFIG_DEBUG_DEVRES))] empty-string branch. Thoughts?
>
>>
>>
>> >  // Expected to become stable.
>> >  #![feature(arbitrary_self_types)]
>> >  #![feature(derive_coerce_pointee)]
>> > +#![feature(const_type_name)]
>>
>> New features need to be justified in the commit message, with a link
>> to the tracking issue:
>>
>>   https://github.com/rust-lang/rust/issues/63084
>>
>> In particular, please justify why you think it will become stable.
>> Usually, we need to double-check with upstream that is the case.
>
>
> I will update the commit message to justify the feature usage and add
> the tracking issue link, without making claims about stabilization.
>
>>
>>
>> Thanks!
>>
>> Cheers,
>> Miguel
>
>
> Aary

On Tue, May 26, 2026 at 9:50=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, May 26, 2026 at 05:28:25PM +0530, Aary Milind Kinge wrote:
> > The unconditional 128-byte const array allocation for every unique
> > `Devres<T>` caused unnecessary .rodata bloat in production builds,
> > and type names exceeding 127 bytes were silently truncated without
> > any indication in debug logs.
> >
> > Gate the `TYPE_NAME`, `TYPE_NAME_BUF`, and `TYPE_NAME_CSTR` constants
> > behind `#[cfg(CONFIG_DEBUG_DEVRES)]` so the 128-byte buffer is only
> > allocated when device resource debugging is enabled. For production
> > builds, use `crate::c_str!("")` as a zero-cost empty C-string fallback.
> >
> > When the type name is too long to fit in the 127-byte buffer (plus null
> > terminator), the copy routine now appends "..." at the end =E2=80=94 co=
pying
> > only the first 124 bytes =E2=80=94 to clearly indicate truncation rathe=
r than
> > silently dropping trailing characters.
> >
> > Signed-off-by: Aary Milind Kinge <kingeaary@gmail.com>
> > ---
> >  rust/kernel/devres.rs | 55 ++++++++++++++++++++++++++++++++++++++++---
> >  rust/kernel/lib.rs    |  1 +
> >  2 files changed, 53 insertions(+), 3 deletions(-)
> >
> > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > index 9e5f93aed20c..79cfe7d9a415 100644
> > --- a/rust/kernel/devres.rs
> > +++ b/rust/kernel/devres.rs
> > @@ -185,6 +185,57 @@ pub(super) unsafe fn devres_node_remove(
> >  }
> >
> >  impl<T: Send> Devres<T> {
> > +    #[cfg(CONFIG_DEBUG_DEVRES)]
> > +    const TYPE_NAME: &'static str =3D core::any::type_name::<T>();
> > +
> > +    #[cfg(CONFIG_DEBUG_DEVRES)]
> > +    const TYPE_NAME_BUF: [u8; 128] =3D {
> > +        let bytes =3D Self::TYPE_NAME.as_bytes();
> > +        let mut buf =3D [0u8; 128];
> > +        let mut i =3D 0;
> > +
> > +        if bytes.len() > 127 {
> > +            // Copy exactly 124 bytes, then append '...' to clearly in=
dicate truncation
> > +            while i < 124 {
> > +                buf[i] =3D bytes[i];
> > +                i +=3D 1;
> > +            }
> > +            buf[124] =3D b'.';
> > +            buf[125] =3D b'.';
> > +            buf[126] =3D b'.';
> > +            buf[127] =3D 0; // Null terminator
> > +        } else {
> > +            // Copy normally
> > +            while i < bytes.len() {
> > +                buf[i] =3D bytes[i];
> > +                i +=3D 1;
> > +            }
> > +            buf[i] =3D 0; // Null terminator
> > +        }
> > +        buf
> > +    };
> > +
> > +    #[cfg(CONFIG_DEBUG_DEVRES)]
> > +    const TYPE_NAME_CSTR: &'static crate::str::CStr =3D {
> > +        let static_buf: &'static [u8; 128] =3D &Self::TYPE_NAME_BUF;
> > +
> > +        let mut len =3D 0;
> > +        while len < 128 && static_buf[len] !=3D 0 {
> > +            len +=3D 1;
> > +        }
> > +
> > +        // SAFETY: `static_buf` is promoted to static memory, and we v=
erified the null byte.
> > +        unsafe {
> > +            crate::str::CStr::from_bytes_with_nul_unchecked(core::slic=
e::from_raw_parts(
> > +                static_buf.as_ptr(),
> > +                len + 1,
> > +            ))
> > +        }
> > +    };
> > +
> > +    #[cfg(not(CONFIG_DEBUG_DEVRES))]
> > +    const TYPE_NAME_CSTR: &'static crate::str::CStr =3D crate::c_str!(=
"");
> > +
> >      /// Creates a new [`Devres`] instance of the given `data`.
> >      ///
> >      /// The `data` encapsulated within the returned `Devres` instance'=
 `data` will be
> > @@ -209,9 +260,7 @@ pub fn new<E>(dev: &Device<Bound>, data: impl PinIn=
it<T, E>) -> Result<Self>
> >                      unsafe {
> >                          base::devres_set_node_dbginfo(
> >                              node,
> > -                            // TODO: Use `core::any::type_name::<T>()`=
 once it is a `const fn`,
> > -                            // such that we can convert the `&str` to =
a `&CStr` at compile-time.
> > -                            c"Devres<T>".as_char_ptr(),
> > +                            Self::TYPE_NAME_CSTR.as_char_ptr(),
> >                              core::mem::size_of::<Revocable<T>>(),
> >                          )
> >                      };
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index b72b2fbe046d..48df181788f6 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -22,6 +22,7 @@
> >  // Expected to become stable.
> >  #![feature(arbitrary_self_types)]
> >  #![feature(derive_coerce_pointee)]
> > +#![feature(const_type_name)]
> >  //
> >  // To be determined.
> >  #![feature(used_with_arg)]
> > --
> > 2.51.0
> >
> >
>
> Hi,
>
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
>
> You are receiving this message because of the following common error(s)
> as indicated below:
>
> - This looks like a new version of a previously submitted patch, but you
>   did not list below the --- line any changes from the previous version.
>   Please read the section entitled "The canonical patch format" in the
>   kernel file, Documentation/process/submitting-patches.rst for what
>   needs to be done here to properly describe this.
>
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
>
> thanks,
>
> greg k-h's patch email bot

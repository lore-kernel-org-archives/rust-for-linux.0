Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5166B34FF59;
	Fri, 16 Jan 2026 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555737; cv=none; b=MOfyJOcLvQxQRiOIrkF+Oj18WcPu5lxxvRP6VbyrXBonJW+J50ud4yt/Cckc68Y0v6Wn4DXIH5KkRZVqziMh1XH36v3EhvjRd1vNhFLg2vYskqBGeBoKXwvv36u5ablyumpkJBIP2S4I4OIKEBcp5CCUb0+e830DB+EpvbjKiQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555737; c=relaxed/simple;
	bh=SWeEPDVoON+GK8CCf1QjL2pzU9Z4ZmMAPDxWyNANgAE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OMSxBkQCsRESK+P1Mwyq506u9Z96BSqtzKIykYgolE6Xv2NWlTzqeocN9Hz8OAbCvbsonDkKEquYq+avs5Lo7YGEaMd4jGGBlG6efgEKw90LOF+A8k/LLzWvUX/5ZBzH1njwFVSLKDrXSJHVoWOpvGsGGlROfs9LTLGcM4XdI34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cq98x2BF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cq98x2BF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E14C116C6;
	Fri, 16 Jan 2026 09:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768555736;
	bh=SWeEPDVoON+GK8CCf1QjL2pzU9Z4ZmMAPDxWyNANgAE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=cq98x2BFVCH4+MZLLKVlnv8oicZ0EEQNYl/2ENNBi1QRsCKsCsaJizUY50DiOIjgQ
	 Gt/pxOUAkxGuIzCC+LckL+wB1/pMX/YAE9mOsKhpALzAuSKpACrwjpxX4eE/e6Vv1x
	 YVaMZwdLtPsxVmxRAHr9P41hXYLxN5co7X4arTXbY38L+IpdiSFjFAjgwPKdzr+wMZ
	 MSlFaGNtgIHOcu+1l6FXc/ADZCbW4TS7HOnxwrfYv45nYHbWNsKcKhSGbBEh3OqpX+
	 mpwrrKNhZsPLEAlaie+bMTdH/84XU7DQCx5byleurkR3jxEXTXLriJh9DJSntfh9Pm
	 WiJHyK6cGO84A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 10:28:51 +0100
Message-Id: <DFPWOMZOX6CI.27JJBKSO6IONE@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Alban Kurti"
 <kurti@invicto.ai>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 09/15] rust: pin-init: rewrite the initializer macros
 using `syn`
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-10-lossin@kernel.org>
 <CAJ-ks9=kvTBHLzepFUqtYn_FOroP3CU0QhyNwBRyH_tHF4p50A@mail.gmail.com>
 <DFPIYDMDHC6V.3CT62XJBRQJOD@kernel.org>
 <CAJ-ks9m-nsn5KTAvSJfu=1kOiKmoadC1X0=zp0GphkX8ZCF53w@mail.gmail.com>
In-Reply-To: <CAJ-ks9m-nsn5KTAvSJfu=1kOiKmoadC1X0=zp0GphkX8ZCF53w@mail.gmail.com>

On Fri Jan 16, 2026 at 1:19 AM CET, Tamir Duberstein wrote:
> On Thu, Jan 15, 2026 at 5:43=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>>
>> On Thu Jan 15, 2026 at 10:45 PM CET, Tamir Duberstein wrote:
>> > On Wed, Jan 14, 2026 at 1:20=E2=80=AFPM Benno Lossin <lossin@kernel.or=
g> wrote:
>> >>
>> >> Rewrite the initializer macros `[pin_]init!` using `syn`. No function=
al
>> >> changes intended aside from improved error messages on syntactic and
>> >> semantical errors. For example if one forgets to use `<-` with an
>> >> initializer (and instead uses `:`):
>> >>
>> >> <snip>
>> >>
>> >> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >> Signed-off-by: Benno Lossin <lossin@kernel.org>
>> >> ---
>> >>
>> >> <snip>
>> >>
>> >> -#[cfg(kernel)]
>> >> -pub use ::macros::paste;
>> >> -#[cfg(not(kernel))]
>> >> -pub use ::paste::paste;
>> >
>> > Now that `cfg(kernel)` is gone, can we also remove it from `rust/Makef=
ile`
>> > and `scripts/generate_rust_analyzer.py`? That is already done for
>> > pin-init in patch 3 of this series:
>> > https://lore.kernel.org/all/20260114181934.1782470-4-lossin@kernel.org=
/.
>>
>> I'm still using `cfg(kernel)` in `src/lib.rs` for linking to the std
>> Box and Arc types.
>
> Are you sure? I'm not seeing it. It looks like the crate is no_std
> unless the std feature is activated and no features are activated in
> the kernel.

Yes:

    $ rg 'cfg.*kernel'
   =20
    src/lib.rs
    260:#![cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync::A=
rc")]
    261:#![cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxed::=
Box")]
    921:#[cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync::Ar=
c")]
    922:#[cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxed::B=
ox")]
    1020:#[cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync::A=
rc")]
    1021:#[cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxed::=
Box")]

>> Also I don't want to have to reintroduce all that infrastructure when I
>> inevitably have to add new kernel workarounds.
>
> Then why remove it for pin-init?

I don't understand, what is removed where? In patch 3 the `--cfg kernel`
is kept in all locations.

Cheers,
Benno

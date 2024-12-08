Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0421E4A3C
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733665654; cv=none; b=IoZtoBbAII9XLkomL3sxs9eneNqFhOkThEvxEmw5/ZBbbXCi59roX8S9yYQ51Vn4ao2GGFrDFJp+TeYC/a64zq2Lkj8ENW/wYLtKskVdpqRU76U27gCr7UDcyWCuoxsVMklRp0msDRrdS6XcxBuOq+yuh8k5l+TXJbvAJfx8Vh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733665654; c=relaxed/simple;
	bh=/Kdo92l4f0E/sVMftFoOWfKDBUoY8BZPpCapNapoQ8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GomMZlSrlXmHIOkJe36oba95S7pRjpSCPVae0MfLjWPhYc8olgUY+qD20g0QkYt5AxUZsrxafUpdQM0XFZPJCQCIketag+KKfgf+MLCMpx4LtbSnVPsSPq8rTbufktTyvBkDSyrwydZBiZjB9wKkKxaNVlK/KhSU2Zb2HlfYiA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FcAd+5YP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FcAd+5YP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BC5C4CED2;
	Sun,  8 Dec 2024 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733665653;
	bh=/Kdo92l4f0E/sVMftFoOWfKDBUoY8BZPpCapNapoQ8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FcAd+5YPf98ykXTxX5a/pA+7frOyDzwkugajpU4w/ERu2v2LymAH8KMjSGvAurDPa
	 NVw+NeR+4TMsMagOasJvJca84BxRyXT26K6Uy25GAVK7raqWjlDkuYmcf4aoKpEWYm
	 PFSbth10jX3rxv1aswvET1/YuC4v4I8z9D1iIS3Y=
Date: Sun, 8 Dec 2024 14:46:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] samples: rust: add kobject sample
Message-ID: <2024120851-thesaurus-monsoon-443b@gregkh>
References: <20241208131545.386897-1-daniel@sedlak.dev>
 <20241208131545.386897-4-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208131545.386897-4-daniel@sedlak.dev>

On Sun, Dec 08, 2024 at 02:15:45PM +0100, Daniel Sedlak wrote:
> Add basic example using the kobject API using Rust.
> The example is similar to the already existing
> examples samples/kobject/{kobject-example.c,kset-example.c}.

No, please no.  let's not have "raw kobjects in rust" even be an example
of something that is a good idea to use...

That being said:

> +config SAMPLE_RUST_KOBJECT
> +	bool "Build kobject example in Rust"
> +	help
> +	  This config option allows to build kobject
> +	  exampel written in Rust.

spelling check :)

And wrap your lines at a longer length please.

> index 000000000000..90db937dea5a
> --- /dev/null
> +++ b/samples/rust/kobject_example.rs
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust example using kobjects.

No copyright?   No authorship?

> +use kernel::{
> +    c_str,
> +    kobject::{subsystems, KObject, KObjectTextAttribute},
> +    prelude::*,
> +    str::CString,
> +};
> +
> +module! {
> +    type: RustKObject,
> +    name: "rust_kobject",
> +    author: "Rust for Linux Contributors",

No taking ownership of this?  I REALLY want someone to own this if it
ever happens, so that they can handle all of the fallout over time with
it :)

> +    license: "GPL",
> +}
> +
> +struct RustKObject {
> +    // This kobject may be referenced later by other parts of code to update
> +    // the values stored within [`MyKObject`].
> +    _kobject: Pin<KBox<KObject<MyKObject>>>,
> +}
> +
> +/// Sample KObject state which creates directory in the `/sys/kernel/my_kobject`.
> +#[derive(Default)]
> +pub struct MyKObject {
> +    text: Option<CString>,
> +}
> +
> +/// Attribute of the [`MyKObject`], creates file in the `/sys/kernel/my_kobject/my-text`.
> +/// Where `show()` is triggered when read is called and `store()` is called
> +/// when new data are written.
> +pub struct MyKObjectAttribute;
> +#[vtable]
> +impl KObjectTextAttribute<MyKObject> for MyKObjectAttribute {
> +    const NAME: &'static CStr = c_str!("my-text");
> +
> +    /// Called for example by `cat /sys/kernel/my_kobject/my-text`.
> +    fn show(this: &mut MyKObject) -> Result<CString> {
> +        if let Some(text) = &this.text {
> +            CString::try_from_fmt(fmt!("Text that was stored: '{text:?}'\n"))
> +        } else {
> +            CString::try_from_fmt(fmt!("No one stored anything yet, value {}.\n", this.value))

Wouldn't this also happen if the text was ""?  If not, why isn't an
empty string the default to start with?

thanks,

greg k-h

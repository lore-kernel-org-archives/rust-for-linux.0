Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3CC3A9618
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644565; cv=none; b=D10rjGuiSf9uT7/i5eGAw2yRqgsKGW6lpyXbhbBdpeiT2efoMgarOAn5VrOn3BoUuUn1WFIPRp522BoBwcCGPngPAhpp594HKXd7A5JOTwWonyLRlrlITnuyoJMFMGb1IfV+6m3zkRAU2VRHJJTtCoZktqIVgMXGL8vdz5NJU3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644565; c=relaxed/simple;
	bh=8iEa6AxayqoL3IOipVUPJQnMkB6P+Ol3KruwnSZHwy4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gfMHWG9vw6Gh6RXkKrNQaHotfF9Y9mI5mlcDqd18peLaqU1Z6jZAtssfyaS66nrXcnQaQqMrtyX2V6zNccNwtvz6BZ5K750v5X36kpw6nkSjbLgnjhxFy+BADi0G3+T1W1lo5USmqMtBkTrQ0wuDWkQaNgwdNB+4ufDZmqmoGbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTPKoGbX; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTPKoGbX"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so1228210eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 14:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781644563; x=1782249363; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtwvoWGU/b/ZQgr5zJFahTctO9fhSyBnDK7Rgb5Kmzk=;
        b=kTPKoGbXpfgrxY/fFNjgMntBRTZKUw7jenqnaWoBs0c+xF2ma4V4b1xEOBUzwgwgUO
         t8P4vq9kvxnk86eMQCCyyWHT7XLxRDAmoi0dTGrp8RBf5PZJJwDmp1EPW8U01ONLfGQk
         A2xosgaTOM2UtlGBU/opI0KpE8vf6/9a0MflUvOTvcZyKPjkrDBHFM/GSfoI+WePOvLl
         AechwcmOt17B37LuRbpFNblJwQuKebOtKWuNh9ZtJ+brT04TLTIJsoqMzRZkaRay4el9
         oDb6r+kjUMzD+36zBbIIG/FDVjhIUML7piwEeih4isc/mwH6Bw6GfCrnHWoaehBHw+J6
         bmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644563; x=1782249363;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NtwvoWGU/b/ZQgr5zJFahTctO9fhSyBnDK7Rgb5Kmzk=;
        b=FCZEM3Yt3sebdp7JVUyhcenPCUNb9sj9ziAMnwUNlj1AZktKO7sp7/lMquXQWGRvOw
         LD85fbvtkvOsksCin6NIwNrsiMm8xKMJ+qRShhQXdKg0R91Ktbajp+mobb2Torrymfnm
         3AdZTKnxFcMO84pD5H/pr8vNG/ex9BEKZF94HwR73/vYDySUjCQohOrAzUxl6uZUUX6l
         rEj73WrKjEFj1jB+Bj3FlNvOVXrRg9RjekR/npz3FlDqGqMGuXyc13LlQdsqahXj36D9
         iH8OVkc4xVlFfXpC7ayl4K6zfcLDRmzoLtEqZKxmU6kx6fZTDHN0TaU9P8Ho3YAffV1H
         ZFOA==
X-Forwarded-Encrypted: i=1; AFNElJ+Z82BsbzoDURcbQGJOnzCA1QRLV7L70QjJDyDRJdD1cE+y4xT1S9v/tCMmz7AGB7DxOuVCzWCHci3Kway79A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QJgG7wrjlnK6EN51mAs3WkQ+4fjKCEL/UOOyFXPT2WZ2Tzu2
	xSpk9EVguFWTHqKTq9uZI7uOLOKRpFJCu7fRvGZSrJKthfL08PD6yuA=
X-Gm-Gg: Acq92OH6iAMZXE/OdYcHbCp9YchcCPSW+R62TiDRBaiLqSZx9/662qQ1l45sNE8pDrR
	IERT/Ksdu1jdAPf7mwonACx9PPkwprdvnuyMt5fnYKpaXsiJjq2lPvtktG9H6btB0L6AhhtSfIr
	mM3xcC10G1ZU1jdaWsgHbiLUbvb8/LYUG0bhucEWoJCKFx5SRQpnV2vTX2vARFladQS8mc3ZQco
	uuzpopof6GlhJ0eQDlq4CCrcou7kQBowvFrfdmlNGEQrNCc0tmYes8llwxXya5QNoiOImKZzyfF
	d6LGHNcTxVZka2RvW6+KkJb4puiCdRsDxNUyU7nLMneHClHPlHyuIURvHdvYTuDTEqPLxAUVbpc
	hMKes02cxZGLntcPPQSXkFuIUITV/tA2IX9RbPbHr1A7IguXlXAkU4lrjo3VomxQcxXxyyloPk0
	V86GJImJN4+TkQGZtBVDo8N+60tNDxl9FL9UKVd87OIErE8VNsfIZp/xrJztc=
X-Received: by 2002:a05:7301:1985:b0:307:2e1c:17f1 with SMTP id 5a478bee46e88-30bca0cebb2mr555246eec.25.1781644563069;
        Tue, 16 Jun 2026 14:16:03 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e4898c0sm21042251eec.3.2026.06.16.14.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 14:16:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 18:15:56 -0300
Message-Id: <DJASAA3M7NVD.SCI2XIBWYTKT@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Tamir Duberstein"
 <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel-mentees@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH] rust: i2c: avoid locking when calling
 I2cAdapter::inc_ref
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Igor
 Korotin" <igor.korotin@linux.dev>
X-Mailer: aerc 0.20.0
References: <20260615201141.8920-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260615201141.8920-1-nico.antinori.7@gmail.com>

Hello,

Please do not apply this patch.

On Mon Jun 15, 2026 at 5:10 PM -03, Nicol=C3=A1s Antinori wrote:
> The current implementation of `<I2cAdapter as
> AlwaysRefCounted>::inc_ref` relies on the C function `i2c_get_adapter`
> to increment module and device counters. This function acquires a lock,
> looks for the adapter in the IDR table, and, if found, increments the
> counters before returning the adapter.
>
> In the Rust API, the `I2cAdapter::get` method returns an
> `ARef<I2cAdapter>` upon success. Incrementing this reference count in an
> atomic context (for example, via `ARef::clone`, which relies on
> `AlwaysRefCounted::inc_ref`) could trigger a sleep-in-atomic bug due to t=
he
> mutex locking inside `i2c_get_adapter`.
>
> Since cloning an `ARef` implies we already hold a valid reference to
> the adapter, the IDR table lookup and its associated lock are
> unnecessary. The fix consists of bypassing `i2c_get_adapter` and
> instead calling `__module_get` and `get_device` directly to increment
> the counters.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260524181151.24988-1-nico.antino=
ri.7@gmail.com
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
> ---
> Citing the second part of Sashiko's report:
>
>> Furthermore, if the adapter is unregistered and removed from the IDR,
>> bindings::i2c_get_adapter() will return NULL and fail to increment the
>> reference count. Since inc_ref() ignores the return value, wouldn't drop=
ping
>> that cloned ARef unconditionally call dec_ref() (i2c_put_adapter)?
>
> `inc_ref` no longer relies on `i2c_get_adapter` to increment the
> reference counts for the module and the device. Also, being able to
> execute `<I2cAdapter as AlwaysRefCounted>::inc_ref` implies the
> existence of a shared reference, meaning that the adapter is still
> registered in the IDR.
>
>> Could this lead to an underflow, double-put, and a use-after-free of the
>> adapter and its module? Or if the IDR index was reused, might it increme=
nt
>> the new adapter's refcount while decrementing the old one twice?
>
> I don't believe this situation is possible.
>
> When `i2c_del_adapter` is executed in `i2c-core-base.c`, the kernel waits=
 for
> all references to be dropped prior to removing the device from the IDR.
>
> This guarantees that no `ARef` is still alive when the IDR removal happen=
s,
> effectively eliminating the risk of an underflow, double-put, or calling
> `dec_ref` on an invalid reference.
>
>  rust/kernel/i2c.rs | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index 624b971ca8b0..d89c42691dfe 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -426,8 +426,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
>  // SAFETY: Instances of `I2cAdapter` are always reference-counted.
>  unsafe impl AlwaysRefCounted for I2cAdapter {
>      fn inc_ref(&self) {
> -        // SAFETY: The existence of a shared reference guarantees that t=
he refcount is non-zero.
> -        unsafe { bindings::i2c_get_adapter(self.index()) };
> +        // SAFETY: The existence of a shared reference guarantees that t=
he refcounts are non-zero.
> +        unsafe {
> +            bindings::__module_get((*self.as_raw()).owner);

I got a reply for this patch from Sashiko pointing out that the bindings
for `__module_get` won't generate if `CONFIG_MODULES=3Dn` or
`CONFIG_MODULE_UNLOAD=3Dn` because the function is defined as static
inline in those cases, which causes the build to fail. The diagnostic is
correct.

I sincerely apologize for this oversight. I'll work on a v2 patch to fix
this (I believe conditional compilation based on the config should be
sufficient).

Here's the review link:
https://sashiko.dev/#/patchset/20260615201141.8920-1-nico.antinori.7@gmail.=
com

Regards

> +            bindings::get_device(&raw mut (*self.as_raw()).dev);
> +        }
>      }
>
>      unsafe fn dec_ref(obj: NonNull<Self>) {
> --
> 2.47.3


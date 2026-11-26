Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694520;
	b=g1EkQJu1Ksbrpt9TRd8RzrUv2nWmGJ6pJ2DihnKUrfLN9rrslJxm9iAFlq5gEKLSzhFA
	 4ycrrzfGsC1SvjCqxN1zYc1YoTSsrwlGUloHakf3J9+T4Ub20hm5z1phSuLPbneCzQ8SR
	 zd/hdjoL9cT96FKKObvKa4CH3uQYrBtiSCN7WXLeRPO2qjZ1xU+6QF3FzF8C0F20zITVw
	 XieytZ/ueQ2JF+vvjeKOSlnuW4Sq3Jlsmkn0/zkZ/IkvaPe1gk9pS+V0ke7F1El8zOQmT
	 IE4kDXC3Og06uWGwyKK/Td8HYfzaIRX/5+BNze2A2SD5YAg/PwvIKKEGSCb7DVB42sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694520;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=rwLLekRJb5EKbWEl2SvllkzjNL+TR1iW3hAQliLLc/I=;
	b=kXCzVYpGmFm7j3z41MIhLVvdVi968vKWzuIfIPMrOwduiXDfXbSP0+ULneVcfE4ij2wc
	 SoxCsy5jDKzEnzujXmMZUKqhmzumZAJKfjoVLUuE6R6Q/gQ/NchwHRMtlovq+djDP7LfB
	 cut5S3zaXknp8AnzGpbBkpUoK4PTt+8bvDh7Dc323o6Xt48lEmtfdGpgo454suH/lZR2T
	 2BDRxA+hiEPEB0mP4UJGfwwgEArfeFWDRwsLg04+rZH20XtBSMdp+QFwJe0VMxyCKpiXg
	 X6EnkHrZr/fIhAInCQOr8GDkiHNDUJy4aDXuKI4AouUgu+gO8df4Vv1fvP0yVxlfIHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XF+n74bX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D7F606A31C;
	Thu, 26 Nov 2026 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XF+n74bX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D1B1F000C0;
	Thu, 26 Nov 2026 12:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795694519;
	bh=rwLLekRJb5EKbWEl2SvllkzjNL+TR1iW3hAQliLLc/I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XF+n74bXNHMwL2XNMo2pWipQHD2kmZUw6j8pPKmXb4RXS3gQDbh/WqOVhZZsl+q9L
	 kZXGUl6NnLNJ7n9+J2WXkIwcug1BvO4Y7FxqjGxHeoWNP66HykE6biCvwoyr8TXMUY
	 HnZ1QkXpBjyRk4t1vdgUibi7MipldgOpM2a0dtMa0J/JRhz6n2WkL6gJGVBUXJMnqS
	 Qg4AKADnzVptSsgWx4uos8XI2HHnfX6PlGw7STDIfpWvqdWCX4APRZfCCpH/JEyAGp
	 cX/f32Prb9GEsgV6HYeG5JOWXWjNS+DMIdTT0R2CT8ctHKkew5U2MJU+mLSOy/jqOi
	 VnOGp6aE1BzTQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, boqun@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: time: implement `Debug` for `Delta`
In-Reply-To: <20261126.202530.1337423276496737821.tomo@flapping.org>
References: <20261126-time-delta-display-v3-1-aeeecc72f3a8@kernel.org>
 <gTPebCrRzRVm17umQBmxYHsjnRVQuaK5YRL3GXYaDhmHwC6zMxULjOo0NuwitISKnfv7wNvW4jmrU165tp4RIA==@protonmail.internalid>
 <20261126.202530.1337423276496737821.tomo@flapping.org>
Date: Thu, 26 Nov 2026 13:01:48 +0100
Message-ID: <87o6bbu7gz.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> On Thu, 26 Nov 2026 11:51:14 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> +    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
>> +        let value = U::repr_to_i64(self.value);
>> +
>> +        if value < 0 {
>> +            f.write_str("-")?;
>> +        }
>> +
>> +        // `unsigned_abs` is used because the magnitude of `i64::MIN` is not
>> +        // representable as an `i64`.
>> +        let mut magnitude = value.unsigned_abs();
>> +
>> +        // Split the magnitude into groups of three digits, least significant
>> +        // group first. A `u64` holds at most 20 digits, so 7 groups suffice.
>> +        //
>> +        // Dividing by the constant keeps the compiler from emitting a check for
>> +        // a division by zero with a potential panic.
>> +        let mut groups = [0u64; 7];
>> +        let mut used = 0;
>> +
>> +        for group in groups.iter_mut() {
>> +            *group = magnitude % 1000;
>> +            magnitude /= 1000;
>
> Code that uses this Debug impl fails to build on 32-bit ARM, for
> example the doctests:
>
> ld.lld-20: error: undefined symbol: __aeabi_uldivmod
>>>> referenced by doctests_kernel_generated.ea22ff07120af58c-cgu.0
>>>>               rust/doctests_kernel_generated.o:(<kernel::fmt::Adapter<&kernel::time::Delta<kernel::time::Jiffy>> as core::fmt::Debug>::fmt) in archive vmlinux.a
>
> div64_u64() in my series [1] should work here:
>
>     let quotient = div64_u64(magnitude, 1000);
>     *group = magnitude - quotient * 1000;
>     magnitude = quotient;
>
> If you prefer, we could also add div_u64_rem() to the math module.

Ah, thanks. I'll re-spin on top of that series, adding the remainder function.

Best regards,
Andreas Hindborg



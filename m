Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DEE32E6BC
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796762; cv=none; b=NGnTUXngza+8be2Jy8IERgyLglL5pbOizPt3jgz5yzDS0Cis5VU46MMcshh74F7PJF/LYv3X//opo8zdOXAK3O19rBGDg8zSysQp1oYzJalX+dKd0fEpMCMMxQ5K4K+SpoTEYbQ4u3hF/ZDVZ/TI24l4hNCy6TKojwAJjaZ9oUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796762; c=relaxed/simple;
	bh=kJtsp1IazgSMj1nbHUhrUJKr18wuS2KWcV03+qv/vOw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Gwcqb32a8mkVFiQdnm0uFL5cTQ09KufoJhF5UrLv8++dI80p7wFrOmYUpX+b4h6RxUTaogqNi/5D7i9Tz8YjpQtdfhnpjGwuvuobMHxpE3ogExLXVhjq7iobZ04Yh7FiITzNUDgH+wOly5uXqywctV9C3xu7rymEcp+s3xfLJfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCMMjNch; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCMMjNch"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-137335bc3caso1613418c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781796759; x=1782401559; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZP2Cpfm9UZ2KtOTUXD2ERtet4jXDhXqiOeuJJjteN/I=;
        b=hCMMjNch8sQeQCnvEEYb2kmp9IObLcmUVeenDwP1KeKxnmEn6Hii0X+DxfkfYt3Iq0
         IFZYzXpwCESDrjL++JoiSIz5gDrriumDq5heBUcPyk8cde3kXQhqIY7Txao5kySuHvuX
         rdYRVGksC3GK0+hWM7/iab13qsAiEi5CgX6nQ50MJIwGLiHKP6ZKX+829J8NzX1/N8Lx
         uYMLP4KAXB8EK0vpce/Jq1Gk2ZcrWVDlc02dkMXZVDHHND78LLJoBYhtugDYxmLSE2pD
         ZZEO2D4rQA9PDVTJC1hJXwR8kxDszIxjelvygNzsjGq7IYA5TNWmYMCybaDr1i/Z/M16
         AL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781796759; x=1782401559;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZP2Cpfm9UZ2KtOTUXD2ERtet4jXDhXqiOeuJJjteN/I=;
        b=VfMRFmBYSkg0Vi18IXVprqpKQn6cWDsgGcf52CxEg2/qFEscx3Yhw+H3dw7thwJQKV
         5yDevZibiz8nFh824uQnJHF6HK+ZTEKFSHupLipbav63ry5zKrQyXxdLU7cx4xQCQdGD
         QMZBqZjsL3OVujNoIrskUe1LqotaIdAGB1m7PrybpYwioitxg3Dko/0ryhmvQWzn4tjc
         w7UMyq8btXbijqCzcHMONyGaWlviSn0eF9wm63i1nE+LMniHnOmbRoNe3YyaH8Jc+9Vm
         pI61s0JLPBElBDCyyY9rPFZFWas5DWvk8Fh4cnaxne5jtt6DaUnoCJAD9RzzVHshl5/p
         mYog==
X-Forwarded-Encrypted: i=1; AFNElJ8djOyIzNJTQBBCqkt/qn6vq+W5l8dsS7n7b+17XvJmtFv1D5h7JKNX4skHlhT1+q3BoJJkDQ8Hm2ua+OukyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIy+Cn6NQkCkRaXFRrydsxZeDLleFahE0rWWEYv3wxBFNjtuXA
	pVedTlbQLDBPDy0OMk0tQZaA4fTEixd4Sl7Sl2lC7hDCIB0Pixkc6eU=
X-Gm-Gg: AfdE7clvFanPzp/Ry+gJB1njI/CA3oAY9ZwAhq8XuW4UFu5vWfbE4HvKTWlTkwgOEpi
	wZuYtNcmTnY7SMD4kn++rPuUHQ5rqlhnDWhW3tTnRV+gcxTWM4L4zZ+x0jg8nuUUEvx/BW2R8cF
	weJT6V/DgCtVqbdBZT05vrjvh75/hZFhXdMQXo46EriNTMqUGr5TYjCUFNMgnoYlXEQ2v5UBsVI
	5n2NvIwkeAM5oQQBFhP3d5jq8QquTsFDRIOCviMEx7HtQEf/kZHDsuG9eQO+QEGUlcmOTEkHksT
	YRVvyYdk7k74m3h0gOvnfgAYsCp+luhQmdGDT3VmBh6SJpDhj+8cki7J5cTfA/bcw8IqRbkPiyp
	lRnydkw4rLDv9W35al30rp+q7ARhd501kLIdL2jWmqJ7w+kIC9VNk5ijitogL7dA2SJH2iTqbfp
	mpTNT9ETuFJk9NowjWc5liRrUR2RcCbe5tTLkfuVf/kPOXs01I
X-Received: by 2002:a05:7022:69a3:b0:138:3613:dc6 with SMTP id a92af1059eb24-139a205f34bmr134839c88.14.1781796758001;
        Thu, 18 Jun 2026 08:32:38 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b964862sm19182868c88.10.2026.06.18.08.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 08:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jun 2026 12:32:30 -0300
Message-Id: <DJCA8F2F93US.1KMA54SKQ364K@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel-mentees@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Sashiko"
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH] rust: i2c: avoid locking when calling
 I2cAdapter::inc_ref
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Igor Korotin" <igor.korotin@linux.dev>
X-Mailer: aerc 0.20.0
References: <20260615201141.8920-1-nico.antinori.7@gmail.com>
 <DJBDWVUWH3OT.1GDEIJT0R4UTK@garyguo.net>
In-Reply-To: <DJBDWVUWH3OT.1GDEIJT0R4UTK@garyguo.net>

Hello Gary,

On Wed Jun 17, 2026 at 11:12 AM -03, Gary Guo wrote:
> On Mon Jun 15, 2026 at 9:10 PM BST, Nicol=C3=A1s Antinori wrote:
>> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
>> index 624b971ca8b0..d89c42691dfe 100644
>> --- a/rust/kernel/i2c.rs
>> +++ b/rust/kernel/i2c.rs
>> @@ -426,8 +426,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
>>  // SAFETY: Instances of `I2cAdapter` are always reference-counted.
>>  unsafe impl AlwaysRefCounted for I2cAdapter {
>>      fn inc_ref(&self) {
>> -        // SAFETY: The existence of a shared reference guarantees that =
the refcount is non-zero.
>> -        unsafe { bindings::i2c_get_adapter(self.index()) };
>> +        // SAFETY: The existence of a shared reference guarantees that =
the refcounts are non-zero.
>> +        unsafe {
>> +            bindings::__module_get((*self.as_raw()).owner);
>> +            bindings::get_device(&raw mut (*self.as_raw()).dev);
>
> Instead of open coding this sequence, it would be better to add a C API t=
hat
> does exactly this (getting another reference from existing one).

I based this solution on the logic used in I2cClient (where only
get_device is needed) and by verifying which counters the C
implementation (i2c_get_adapter) increments.

The i2c_get_adapter function in i2c-core-base.c performs two increments
(module increment is done by calling try_module_get, but in this case,
because inc_ref operates on an already live instance, unconditionally=20
incrementing the count with `__module_get` should be safe).

If I understand correctly, the idea would be to introduce a helper=20
function on the C side, for example:
void i2c_adapter_increment(struct i2c_adap *adap);

We would perform the increments there and call it from Rust. Using this=20
in inc_ref would be safe because the existence of &self guarantees that=20
we already have a valid, live instance.

Is there any concern regarding this function beign exposed to the C
side? To use it safely in C, callers would have to ensure that *adap
points to a valid instance.

>
> That said, is there an actual user that needs this, or are we just implem=
enting
> AlwaysRefCounted preemptively?

The only user I could find at the moment is the example driver
(impl platform::Driver for SampleDriver ..) in
samples/rust/rust_i2c_client.rs.

Implementing AlwaysRefCounted is required for types wrapped in ARef,
which is an smart pointer that handles custom reference counting.
Since I2cAdapter::get returns an ARef<I2cAdapter> upon success, the=20
trait must be implemented.

Thank you!

>
> Best,
> Gary
>
>> +        }
>>      }
>>
>>      unsafe fn dec_ref(obj: NonNull<Self>) {
>> --
>> 2.47.3


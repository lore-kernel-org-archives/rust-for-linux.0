Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE8D265CA2
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345857; cv=none; b=kUijYrzGwt0xuaHKcKnWGLtKVyyKzotm8Mjkp7MFlta7jPtni1/offRd8041AXrPL5GJYikEWf5Y0lvIUk2UP+qL2Nmeh1c+Pq/SXwQYoebaUrueMXBSVQSjkcx7S02NjkTQOio/QS1GtqBwL5/H+9PgLu7swWs3b43b4711kL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345857; c=relaxed/simple;
	bh=IgUdviJEsSFTVxZilVLZxpOnx1T2poIBfRVSuMDMnfY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=JAuMajxu/uBwZF/IByCf7ehrmxkfuQQ6xRs2fIzRr9IMQvQsWs/FE4zQmGHDfFT9LOKEP/Mjau5kd4vq+hnZbW+yVPzw8KdNy/xkr/sPgtPAuZagNxzDt41UROkYT/KGrOLnhX6EN6R55lDPTXh38jrxPLPsAr5Z2mjf1ySGKV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiSraGN/; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiSraGN/"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-73b909fbb6bso1890610137.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783345855; x=1783950655; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rokkLcuskiz++BokjvjyUp6gnS9lDDUYlv8J+paANt0=;
        b=LiSraGN/jG0wIJfrhMOF6A/W81qu012u6jLq1EBtw7fWbFvueJwWJiDV+y0Ova/Dzp
         SC0XJ4pkdZQEPay/M0aRBbThUR5F7OdXlxkiqHgtntnsY5qOcmsMCXHUeUWiH3BEp5vi
         TCcBBNhDb1vKAE80ZjQgThoUGMaDq3MLzWdVppn1LEGXQxnJMZmV47qjHgZuGrkYnVrr
         oOGnyJyPxzsUV/dBrgJvilPCkybeOPhwV9njV4dzlE161GawPtAmKSwDxV2ux03NMi+1
         SyhRre5myV/XpkustcaBrA+j/7iTgvCaMZFLQ+YRuGNndp0B/rGp3QLHbCK+rY3SAnaV
         DNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345855; x=1783950655;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rokkLcuskiz++BokjvjyUp6gnS9lDDUYlv8J+paANt0=;
        b=tGPy8xdGoVyvgiNaIA2Pv8svB9y/UETu3kgizzw8h5K2cs7qj9eSKJ75hLsb+Q3DHp
         JUYS64zugnMsdcjiADsKei/2cL36IMZj0iZdEIoOSCUfgbT6yzKb7hFnsA5Zryjknu07
         3X+b4LHBa3iDU9C851QSipV2aRB9x07bXhJXdEumrh8RzxEuJiZVWKUIlcquwITeUG9o
         szC/llrAOsNZbL1AYnfdrwg4pYKClMuNvUgzTggcr+SfK5iW9APkHqA/INqVPgNJ8l3C
         JQTd1izj7MA+8oUTYV/5J5gxIJZUVwqfCdhHafDQeosSZe+yTaxU4nf0Nb1BwBF9SrlS
         DNBg==
X-Forwarded-Encrypted: i=1; AHgh+RoBAOoObNUM6eLW4pCX9UeaTuIW1kY68KaMJCgywYZFl4zX4c81VZuMHVD6sxFh2ljloD2a1+VvlPZnr68DNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1lfIyhCxgOI3MeV1Fsf5Q55TlZdyHPyyUxjv4/E7/7g1ld/eN
	POj7l1kHnRxrh3yw9Giu1oZMvy5DtSU4ol3lo86+Y9Z3urFqBvMGc9Q=
X-Gm-Gg: AfdE7cmJ1DOKTNcClSi/JGkefU+kFT2GC/g+GK8/Hp0qtexowkG+ZeVWJgKrMD1/KQg
	hgzaD7W1YLa49875MqSCdMY5Zzvk4QHPTDFLGpRL9cgDOAA53ZGYKj08NIFoMwh9sLiQOn4j9hO
	1SXlddDQ1SvFW/Ndb7QHNRPjg2+6L5RQnUAsiwROOxGxYLq6h6s+5GaGtefGFHgVnU8V1GiB1wY
	qi9dV5GmlvNwwvQQ8fOlzum+374uSKfgF5mJrdEiAjmOERtaRXFQJNbdnblB2rGPYS/R8adbw0n
	+lWsoEylaOJrOC6tjVmq4TloK9DelE+PEXdzVJKkwYLA5BVoB2C2uhAfwvfyZRLR2v/8zY/Lzl3
	sUB1/iPG+ncc3p3MTWFOitm3deYZLJi6rbRWdgSJve3vOJ4vMKHWoAn6IPXtxE+gKE890MYbYqK
	GaBKHMAvS0uqDxkYVC8nJMfSE3ES4eO8q4b/Y+XyciCxoXUcI8
X-Received: by 2002:a05:6102:390c:b0:738:54e8:c101 with SMTP id ada2fe7eead31-744b7c8f42emr313140137.15.1783345854585;
        Mon, 06 Jul 2026 06:50:54 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96b3890d5bfsm3509015241.11.2026.07.06.06.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 10:50:47 -0300
Message-Id: <DJRJCCGCXYOL.2O4HP9N37SPAK@gmail.com>
Subject: Re: [PATCH] rust: i2c: avoid locking when calling
 I2cAdapter::inc_ref
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, "Igor Korotin" <igor.korotin@linux.dev>
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
X-Mailer: aerc 0.20.0
References: <20260615201141.8920-1-nico.antinori.7@gmail.com>
 <DJBDWVUWH3OT.1GDEIJT0R4UTK@garyguo.net>
 <DJCA8F2F93US.1KMA54SKQ364K@gmail.com>
In-Reply-To: <DJCA8F2F93US.1KMA54SKQ364K@gmail.com>

Hello Gary,

On Thu Jun 18, 2026 at 12:32 PM -03, Nicol=C3=A1s Antinori wrote:
> Hello Gary,
>
> On Wed Jun 17, 2026 at 11:12 AM -03, Gary Guo wrote:
>> On Mon Jun 15, 2026 at 9:10 PM BST, Nicol=C3=A1s Antinori wrote:
>>> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
>>> index 624b971ca8b0..d89c42691dfe 100644
>>> --- a/rust/kernel/i2c.rs
>>> +++ b/rust/kernel/i2c.rs
>>> @@ -426,8 +426,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
>>>  // SAFETY: Instances of `I2cAdapter` are always reference-counted.
>>>  unsafe impl AlwaysRefCounted for I2cAdapter {
>>>      fn inc_ref(&self) {
>>> -        // SAFETY: The existence of a shared reference guarantees that=
 the refcount is non-zero.
>>> -        unsafe { bindings::i2c_get_adapter(self.index()) };
>>> +        // SAFETY: The existence of a shared reference guarantees that=
 the refcounts are non-zero.
>>> +        unsafe {
>>> +            bindings::__module_get((*self.as_raw()).owner);
>>> +            bindings::get_device(&raw mut (*self.as_raw()).dev);
>>
>> Instead of open coding this sequence, it would be better to add a C API =
that
>> does exactly this (getting another reference from existing one).
>
> I based this solution on the logic used in I2cClient (where only
> get_device is needed) and by verifying which counters the C
> implementation (i2c_get_adapter) increments.
>
> The i2c_get_adapter function in i2c-core-base.c performs two increments
> (module increment is done by calling try_module_get, but in this case,
> because inc_ref operates on an already live instance, unconditionally=20
> incrementing the count with `__module_get` should be safe).
>
> If I understand correctly, the idea would be to introduce a helper=20
> function on the C side, for example:
> void i2c_adapter_increment(struct i2c_adap *adap);
>
> We would perform the increments there and call it from Rust. Using this=
=20
> in inc_ref would be safe because the existence of &self guarantees that=
=20
> we already have a valid, live instance.
>
> Is there any concern regarding this function beign exposed to the C
> side? To use it safely in C, callers would have to ensure that *adap
> points to a valid instance.

I tried implementing this with the following C helper:

...
void i2c_adapter_inc_ref(struct i2c_adapter *adapter)
{
	__module_get(adapter->owner);
	get_device(&adapter->dev);
}
...

Calling this from Rust results in much cleaner code. The function does=20
skips a NULL check for *adapter because the AlwaysRefCounted::inc_ref=20
signature suggest a non-fallibe operation. Did I understand your=20
suggestion correctly?

Also, does it make sense to declare a C API wrapper whose sole purpose
is to be called from the Rust side?

>
>>
>> That said, is there an actual user that needs this, or are we just imple=
menting
>> AlwaysRefCounted preemptively?
>
> The only user I could find at the moment is the example driver
> (impl platform::Driver for SampleDriver ..) in
> samples/rust/rust_i2c_client.rs.

Does it make sense to move forward with this patch since there are no
real users yet? Does the Sashiko diagnostic makes sense? Maybe I
misunderstood it and it does not apply.

Thank you!
Nicol=C3=A1s

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393887;
	b=mN6yNCodG11TP8+0Sjn6jQOT/81cdhD+eqRL/x1uew2Jrh2tDgw4Bd8J1wbvGHxW+PBy
	 tjlpQdlt9jP3/VnbTydCewbtdoQ/kIfKUzJS4VrqhAdxMO61jz3oZ0ZsS+jIlmePhPlPz
	 C9g99R/NiUPPBQI6/MhnSCldCWBfgjRuJQJzNmAZVWq/i4fDogg7xzK+LOFPWFxjXyE2C
	 QKB2avwKTx1hIm3t9tPl/2vVESf2yTptkEydx3Hz4JPkBfcZlRzS2W4iVfAqnrSuTHinr
	 j3yr8Wy2LGTNzo6p4jOwvqjQN1et0rv3bVCbN2uTf/j3iSy7wuZtEWNpCuf+u/1dCsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=e39tlZHzmx/bxiI/iUdemmQRs6p1buIjK2wE6pNqiSc=;
	b=bKqqiZF9vvX//kskdfingtX+Q57jrYEDmB6ZSjY5gDpG8sTKUzhsB6sp39lZyMTAtIz7
	 8lLwkohtjSijScU3RrYfjG2J+OGq/9Vrxfr+3MzlQAt4tUXtj+RUcX797oRPuKv0zA5CE
	 zH7AFfRS2+RQQvFUcCeHKgqezGZqulkpWOhpjTknyw/DPHGLn/1Brlk2yTakPiVJXnVoe
	 Kk+plBkh9228jmvxxYBsE+D9Q0CDAwZxsqhTlmKoOgKmsGAY1M+zcvEHG964LlZkIXCS9
	 9RKzIDZR1HLnRh1k7MCPFFiVCSiZmtiqQGWeqT8QCn8QkMgQ73nKRG0Vqvnr4U5it2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bHZ4/Ixb";
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFD8606A31A
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 00:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFFD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHZ4/Ixb
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a05b210703so1186794b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 16:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795393886; x=1795998686; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e39tlZHzmx/bxiI/iUdemmQRs6p1buIjK2wE6pNqiSc=;
        b=bHZ4/IxbDhS68IOlYgZmMgFojKTMzxAN8Oafo5xjlPz5S1nfgxrvHkr938IUhthyZt
         zvjUMkv+vv++wjf7Fn0Kd7iVR957Rdtq5neZ82Zo2iHSq8ACz3OslATAZYrtXfhh4KFy
         AQt32KGkxGQGnE76bebO/p3NkGo73QgFvzQF0vtWQyEU/prsbsVQP3r6UlsqTsxwvkZ1
         9T30r6168y/Zjs4+UYUav4wUV+ZnmCeS5KEdppOtUqw5bweII93U3fh0jbvHLvRcVYIZ
         vEeklZr1LyEl58BElyaobwMHawaDFsRBC3HN+f0UZ7HMz0lgysdmpdZvQt8K+onNOnUP
         IDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795393886; x=1795998686;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e39tlZHzmx/bxiI/iUdemmQRs6p1buIjK2wE6pNqiSc=;
        b=tHx6zB4I70tJRuhVmRhOAYCMHmzzmStPdkYzKIayFf1nWmOmQhf1XNBlFgCJU9iAwn
         6dhvQb6aWqMyw5tU+zHCyTBErzxEQmKIr9I9vkR/7uAvKdXBVYKgnKuSeMxE4y+qaztc
         H9v0N11TWm69XuXotYEm08+j6I0X2W8KoBsr97N6Om0ymZDBAQ/FQpMc+yW+XERnBeHt
         t7+uq/Zuh0BfuVKeSmmHd3zFLVJqbdHMvExHpcu5UogpI6LIOa3ewJH6V7qm1v1hcYjz
         Cceld/JuMW2iaW1KxEcNoWXC9bexoh7VDGStwgAuZYvRAI8CWOPOKSmV8qs+O+dD95EX
         Evhg==
X-Forwarded-Encrypted: i=1; AL+hErE0OjGy0rNrvGl4XgYnCHQgcvLKmgEGEWmvdkoMC4sXq147pYlUzXjmlt/wwwGaAZtA7xvxl4ChblmDFrB3QQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+vcTpUR3LA8G8WsS71rqZfaDpbT61PmRbxoe38XQkh0mV8hctn
	Z3fYbBBTiwvB3kA0V8o1iC3vEB0O+08XwTX4RPEVZDWIdu5zFVmYdRc/
X-Gm-Gg: AZFdTZeuvqneT/PSfb4xftCkhVYgHhvdD+34P2p19dJBotgS/o75dcWoT/a/tFnuZev
	Y/YoZfOeVU8Tdj8IZqCJC0FeX9p74v5mKuwb/owtzEoorQyVcdJ/egEHzxfcGKkDcJC/dv43Wc3
	+4NPmT0Q/B3Th/QqHmNpWySSR6aT433FEvf10Czy1YvViok1z+50UjvpuXThKtiX5D9e836MzIc
	Sfz7/PSmYJE+G+1D1STyE/woL69kN7PllvIIao4mjjM9R/DC6Xm5biooqbO3q3Vdq+AyOo81rw1
	ccpMNjIoysMsHIqKQzBWwzAAKvLI4VZyrwn38aeAoJZ7LMb6vj4wfr6xt8uHquY4hvjeWqtMVNT
	qTGdt9n220qEJUHSj/IqcY5XXsyII6mZSjVPUmMgSAh8vJrWLoBfGAAQE1UXLvc9NWqPUKiLwlN
	++S7aMEyZlfd9ZIofeWOtV7PlBrZ2qeOqwQnrqy5/E513L4HaMXVsrWsBqpBEGUjC3YXWNIMHIG
	8EAWyH9mKWe/tmfF0dDEiXhIZHw32lhUMc/z4ZhUyJ3+B+QkkFFU+iXSTQ7kH5IspFaL5FR1RBq
	EfW6uNdjXGxSDlptqcSkr8yEFceUC7gtwjnbqKXTiARhrO4=
X-Received: by 2002:a05:6a00:b43:b0:878:38af:1970 with SMTP id d2e1a72fcca58-8c87dce532cmr8545457b3a.60.1795393886071;
        Sun, 22 Nov 2026 16:31:26 -0800 (PST)
Received: from localhost ([2001:8004:6b00:7582:da58:72e4:4f6:67f3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm4589844b3a.7.2026.11.22.16.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 16:31:25 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 08:31:11 +0800
Message-Id: <DN260E1QVCJA.2PKN1JODEAOB0@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Jean Delvare"
 <jdelvare@suse.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: dmi: add basic DMI matching abstraction
From: "Nick Dowsett" <nick42d@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, <nick42d@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122-rust-dmi-v1-1-4ace9449f872@gmail.com>
 <CANiq72mFCq01A_=B0gyaut1rPWeECOdDwP6pD3FBv7n4oH6TWg@mail.gmail.com>
In-Reply-To: <CANiq72mFCq01A_=B0gyaut1rPWeECOdDwP6pD3FBv7n4oH6TWg@mail.gmail.com>

Hi Miguel,

Thanks very much for taking a look!

On Sun Nov 22, 2026 at 6:37 PM AWST, Miguel Ojeda wrote:
> On Sun, Nov 22, 2026 at 5:28=E2=80=AFAM Nick Dowsett via B4 Relay
> <devnull+nick42d.gmail.com@kernel.org> wrote:
>>
>> `dmi::get_system_info` is currently marked safe under the assumption tha=
t
>> Rust code is always called after DMI is initialised. Would be keen to
>> have this validated. Alternatively I think a minimal patch to C could
>> actually make this safe earlier if required.
>
> Please avoid soundness holes unless there is really no other way out
> and/or it would be very, very onerous to do. The bar is really high
> here, i.e. if this is just an `unsafe` function, then please simply
> mark it as such, which in turns allows us to document why and to force
> others to ensure it is correct when calling it etc.
>
> Of course, if there is a way to make it safe (whether with a change on
> the C side or with API design on the Rust side etc.), then that is
> even better.

Sounds good from my side. I think initially it's OK to mark this unsafe
- the precondition will be easy to satisfy for the callers. Seperately
I can then investigate a C patch (I think using atomics for
dmi_available).

>> +/// # use kernel::dmi::{self, Field};
>
> Vertical formatting.

Just checking here - is this still applicable for doctests? I copied
some of the example from another subsystem. There could be some
conciseness benefits from not doing this here?

>> +pub fn get_system_info(field: Field) -> Option<&'static CStr> {
>> +    // NOTE: This can be upgraded to cfg-select post Rust 1.95.
>
> `cfg_select!`
>
> Though I am not convinced we want this sort of comment -- it is true
> that we have similar comments for explicit workarounds we want to
> remove later on, but in a case like this it is the "standard" way of
> writing the code at least at the moment, rather than an actual
> workaround. And we can always grep/LLM for these improvements when we
> bump the minimum version.
>
>> +        if ptr.is_null() {
>> +            return None;
>> +        }
>
> Newline after this?
>
>> +        // SAFETY: If non-null, `dmi_get_system_info` returns a C strin=
g that
>> +        // lives for the life of the kernel.
>
> I would word sentences like this stating what is known to be true and
> why (since that adds information), rather than conditionally (since
> that "repeats" the contract of the callee), e.g.

All ok with me, I shall address in v2 within the next couple of days.

Cheers,
Nick

Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF5137CD2B
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535495; cv=none; b=CJGIny0s0jvy9q2N4cdMtJXWe08vqXJE9AcxB8bItIjNET5yCHLIPu0/WpxEqip9f91yIWLBdIcZDF+Ln3hkdBxEQUfn85eL3m7BadiNIrrS4WKlq2BIJTf0pKmoL7BXKTYXJ59RT9oKp8IxLuLnGfh7o4i7NkwAEtmguQlHXw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535495; c=relaxed/simple;
	bh=3Vzte3b1zLfQQJBgi5xEQ7PzA9z5e7EmHBF4s8am6qI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlUe8VOr8lUplwFkNNVguPZJL0OvOqEu5g4dK9eXIqBTN/rbzj86OpmkLgmsEeEikFhRZuysvjnZ+j1LkuULFyaqzJNMYZM3tCUweXSUkNj9WLhziz7C9OXdeEnf+g8pS0DEuvsN7MDcPGXR69MIRg7r1IAZYRvC8B4Sgy1DiZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCTj45Fs; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCTj45Fs"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439c56e822eso1092910f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535492; x=1775140292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jv2EfhMbcWOA2sU2awQXAMiSQ1dwjbJBc3BzfW+6rZQ=;
        b=jCTj45Fsg1mt0evp6QQXTV6GZLmbeMqtXFXwPKuMUZbRRoQqQew70Fgx2NGx4f96nq
         rtW5SrDz4N6rRh+rXXok7lAKvu+Ip4QJSrGEk9BstwuR6goXQRh/Rxv6zdVtrKxK3AXR
         Z/BM4sTiIyVfXtl7t+CDrdK5bbz7exdE+AYEZIy9i6xTW9DsjY2HhOd/BSFdSMgjqoPi
         2azh6I2sQ4zKefYgckNEtTw6tIQQSc3QzjZI8Iy9aLVg9sJuKst8ad+joyBADw5Ffzm4
         jIRyJsT8FBNgjm6jj6GEwke7Zet0tGQnEtoxQYy3pmgjDjIDUBXJLYCSkPNPk+gcY7Sr
         g1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535492; x=1775140292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jv2EfhMbcWOA2sU2awQXAMiSQ1dwjbJBc3BzfW+6rZQ=;
        b=bSgKegSMHJMerKkf7an0JMfauKF576qU0iNnolWyHJBqRhe7eJQu0Nhf6jaBh/u9cr
         He0gXAHGaMWgKKINlKtDpxFUe+vrZyFALeAOwWnMO9vmpcm1CaIQ8May32+x02T18iej
         MQzaV3rW/C2eBMAfk6RlZIMDrOe8byQ9XSk/cgGlBU4Gxv0cYcgEYKgQu63Mv3f1WMUM
         +fR7Xm+O9Ig7WWdCsxMWft/5JyB+q/lZOnh/x+ITtP3oDdyAnt8Roda04Qvy3d/yXCUY
         N25/tfXnmi0eZ5igoo2ZMNz8sTSEHW7XYPGpvTWUcK/CsYhwfSVo6CxqfLg6dIVGjVN1
         l+vg==
X-Forwarded-Encrypted: i=1; AJvYcCXTiF66F+knQmrRohGfE1WYTE5F92iaHPzj9LjVwVzwHO/9s1FQ6t0QgQcDwtzNXuk1MvQLJTUW+oJBOYjIZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx15i/J+WXNf5hvN08GhFvQ43qimquDrIx7bVSi3EaiTvCF64L
	rvMYt38YRsGp5agIz75dIMqI76LN3e/7Yj8V806xrmh6D9/577rz4eT1
X-Gm-Gg: ATEYQzzDsImxN4OqKET51T+KZzO7vMZjSofVmd9WQQtQIRij9fRwY5qY6IC99xheaDC
	CUt637mKQwnEvhta9CAB1B0xKWMnwANMEGdYw3ct6IcbsNAjngY1R1x0VE66DgrMEbLxsgOEAUD
	UbBZzt9ZmdqeqsEhgued6mWiL4tPzk5/HE07GRzzE/XqPaPiAsr+YnAxEBbLKHUh7J9DohnVJ0P
	zQk5Ep1lc+Dja+LGcHzCforrSbv2GZFL73MBX9L6VNhz1Ms91sroSxNVSHsgdEPGxPz6riJIlug
	26fVyMcZthPsXARVpuwZdNM7HtLcmo2wPRNuowZpk0Va8s4CqbvFcTbj+Xg6FGZyjjrCSys7vfD
	X8h/USyu46Hc8b8p/ov59dTNnon7qq0AfcPlOLpz9tLN1ziRefP7Kfp1UXLYx8kWkm90lyyOG3i
	kVxOkeApNEBgfcGJhrHKN4lCBaYlow9UyyuRtF
X-Received: by 2002:a05:6000:4381:b0:43b:5672:f02 with SMTP id ffacd0b85a97d-43b88a21651mr11427910f8f.7.1774535491079;
        Thu, 26 Mar 2026 07:31:31 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:d2a7::cebd? ([2001:871:22a:d2a7::cebd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e528sm8063097f8f.1.2026.03.26.07.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:31:29 -0700 (PDT)
Message-ID: <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
Date: Thu, 26 Mar 2026 15:31:26 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com,
 akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net,
 justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev,
 lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com,
 morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
 richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
 urezki@gmail.com
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Miguel,

On 3/26/26 2:47 PM, Miguel Ojeda wrote:
> On Thu, Mar 26, 2026 at 11:10 AM Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> I noticed that the Makefile currently uses the arm-unknown-linux-gnueabi
>> target. It should probably not be -linux target to avoid this? Probably
>> it should just be armv7a-none-eabi, right? We gate HAVE_RUST on
>> CPU_32v7, so we should not need to consider the other variants.
> 
> I think Christian tried several targets back then and eventually
> picked that one.
> 
> Christian: what was the reason to pick the `-linux-` one? e.g. was
> there something you wanted to rely on that target spec that you
> couldn't enable or disable via `rustc` flags or similar?

It should probably be fine to use armv7a-none-eabi. I've mostly used
arm-unknown-linux-gnueabi since I though it needed to match the
bindgen-target (which is -linux-gnu for all architectures) and 
because from what I understand clang also uses arm-linux-gnueabi [1].
Also when I selected the target I thought that we would also support
armv6, but since I had no v6 hardware to test on I disabled it.
[1]: https://github.com/Rust-for-Linux/linux/blob/rust-next/scripts/Makefile.clang#L4

Cheers,
Christian

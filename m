Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15A43BA22C
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748209; cv=none; b=YNe1B2onljneERqBKZGs1qReiWQ7FDhhn363ZapAp8lIbRo3qMg2NZ55Rh4Ks2SzSPxw6l+0Rr/zoRX48a3IOvTFFJnGUbxTnLpJO1AfiG7Q12KnVBfC9AprlD43Y/SXeHdgxUY2KD4naRIusgaV1rC+bGhR963KlNZMOKIGQCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748209; c=relaxed/simple;
	bh=y6lUUJwNmJwWDTpMLkBp1YAtLV9LN/nEevAEE/TK01Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqtZ7AOUlSvxMXrZEp2i6w+1Ty2V8qT0IN0c+Zq44345KgV8noTuW5OyXWHrCsQjYt3nQShYyD9MRJHzWTChj8tJnyIARO/fuhWE+mRnSzIErrvVsmQIK3v/Loy/4nxJSJ44+uPnrHYWB6ypvCMGwXhwhUjhPe/01VRFhuuEpsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aWMcZFWZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aWMcZFWZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so1598107f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785748205; x=1786353005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1GNJHA/wk3B/tLgEj5BiBlQSmADQEGBijFgHvx9KdQ=;
        b=aWMcZFWZ15JXnt8TWF2uo+PYSu1Q4FwWy0fwoZaGosqKIlt418xFk+VR4t9hDsVAC1
         LqT9/tS86SxoqYGBrA8ABKv89rYQCylPYSfPhPJVItK1RW2zd1IJscbOIsra7EOf1niA
         nuBdYIWug9bzklmwD5xesOxJ2rWvfQMuZlUf8DrwEWCjwlRS3ANQDDsBjzkK2pKDlp15
         p++v35a3BZsBlqfxUuqJsFSZ2I91/gfiZY+rUxGUEpXyI7IgCEEspukuBRHyvsNIFU+n
         f8X5VDjoi/O/ykIdAFiBMJBEaP6Kly5ExCCJK0TsyUcejhB3Xl/870e2IhQOQLFxEPE9
         PnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748205; x=1786353005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1GNJHA/wk3B/tLgEj5BiBlQSmADQEGBijFgHvx9KdQ=;
        b=BKGzrvvy/FEZbooHYKu9mHnjYFtB9suBNwtJUS5gVwV4VhQIwAP1dDmfhOf6uoTZFa
         RGCH6O92CUd+/EELY/ymCXVBifeep4XWv99EWEp/VX2Pep3uUN54xTrCq3PzAu7YGjH8
         Ib0EGsdy37Py6r9RD625F+tASqiTSqozEVmtbMRMJ79qx2DeopMtxn+pF3EaJBQdfyqX
         81hC4t2BZ/taCd9KG20IQB+nZq7mwG4sjxLGrf9xqICUJ3v6HSHYOoMBfRSqoy2PZSm4
         SpUTS92wMafl22iczcEeL/3DWdf2JMCgMC6sFri4fPS+PFK55d0FEGPmT+Cqd4PneSNj
         BWsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgvQnh6Aw6/Jef3o6hYkEeqCw8SF4edHZ6gryYIk3YDJ3dpum/XdnQ70BNYnh0MrmUpQDLfD7/+JFwGcK+Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL7XhtmeXTQ3B1yyKSfwQPN4RDg0fsthHSBJDzPTwxh135wHFF
	zL3SNkGIDPVxbpqeOJHdugMvHN9cLmyfG3Kcmhkj6Zza/gMgjzrWey/4TZrRvBH1BsQ=
X-Gm-Gg: AR+sD115/5XH32GrqVnQ6Ks1gNbuAsBXzPrvGCayjnKz2kkvV9tvSdhdh7BjLb8fbUr
	walbbeNBKwf0di/dkKF4uwbQY1FkbIGFvHX3yDjVjf/Rd5q0QJhBwExKontNPfBsQs7Fd08Ag2W
	4i3fv46JUv8H+DIH6+WOdOKUPHveBlo7HdEE7biZFtKK5G2Ep3bQIKgRLFDhbD3bWfLyE4uCQ1B
	3xQfj0JESh8tjjI1EMAH3+XV4odyVSFkRRED2wnNPZ6YdwLsiadZ0CdPKt8ab3x0kzVd9ktcrel
	6hFdCOfpNZzzF74lGOKt3+cPUubsZrq0C7pD6uCkhXh6N3zye1hBMasKorerzx778Fn3iqG6P1A
	gpBDx+9+zfCXXAGgtygik2zLLed98bT0vhIg3hO+BDzaARMqTYsFX0R1KXw99y+BZFHQDAfrHg2
	usNkaFaIu5GuhgdmGzuIdcoru6uL0y1Yx2teh8Bouel684nw0IRJoWOeiYjeB+rxmHA8Kt5WbZn
	VYJS29Re/GXqcD3uko/eD/SZ/s9xl9Mra9VCCPgP4xHVSoGiayLVqsGAEFoBFxQwHgHX4G4NLQA
	jmFcWqot4TbxGcavnC4/GZw2wXVVwPU=
X-Received: by 2002:a5d:46c1:0:b0:47f:8b9e:f457 with SMTP id ffacd0b85a97d-47fd72b0552mr16078486f8f.17.1785748204889;
        Mon, 03 Aug 2026 02:10:04 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6cbsm28027816f8f.23.2026.08.03.02.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:10:04 -0700 (PDT)
Message-ID: <e8733203-29e9-4a3f-b41c-198dcf1d5273@suse.com>
Date: Mon, 3 Aug 2026 11:10:02 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc
 abstractions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-modules@vger.kernel.org, driver-core@lists.linux.dev,
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann
 <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>,
 Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Igor Korotin <igor.korotin@linux.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
 <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
 <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/31/26 8:29 AM, Miguel Ojeda wrote:
> On Tue, Jul 28, 2026 at 10:39 AM Alvin Sun <alvin.sun@linux.dev> wrote:
>>
>> Back in v3, Gary suggested this series go via the rust tree.
>> Would you be happy with that, or would you prefer a different
>> path? If so, is there anything else needed from my side?
> 
> That is fine with me, but let's see what the modules maintainers think...
> 
> Luis, Petr, Daniel, Sami: what would you like to do? This touches your
> entry, so it would be nice to know what your thoughts are /
> Acked-by's.
Looks good to me. I've replied with Acked-bys for the relevant patches.

-- 
Thanks,
Petr

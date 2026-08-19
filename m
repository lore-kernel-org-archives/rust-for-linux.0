Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E7B42B327
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136137; cv=none; b=CZ1S9Dgmq7TW+62E0ZLg6quTD62nEktMIXjdv/MfNoz8D89oHQafW38s69tAZQZ7mVl44WY/TGnQLz/9fQxWKZthG8hnGZGv2hZamQmZ90uxSDr3etJ9xXsXMm7OwU45wCHJ1Iiu2tCsPw0ge6JRGCnVgd8hxJ4tEnED2AKXWtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136137; c=relaxed/simple;
	bh=MJmPLrWrHSnAlKb3Iikhz1ynzwSjPJ+Nvz3+9YWkqeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kkgt0fbs/ERz03qTkWP7X6uTF3YaqgFkMmfn+/ZjiYW8G179MHZPzWVI2mvWgox7F5E8z68E0b90O2fkJkM1bXrMmyb3KjVj9LQBrfMkuFMgRCgQxyBRaaqSeicUcHvKNJS6dUyooqa6mN4LtKotb7ZlfzOngIiVp4dLDO8D12I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0gQ9wss; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0gQ9wss"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso849851a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 03:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136132; x=1787740932; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4i/Wj7VbjVfeq660KhfTJWgWKQG02yPSN0FVJhBIXyM=;
        b=g0gQ9wss39d9gabTAfpS6/Gfgnxvv+7qCWdJvhJqNaGY3rDvH9qQBQd82FyEE0b9GQ
         lBA2gneppYwNc2L/sdQWavT0ZoZzjjl5nChjdOP/dQPTa4YXxxj+Ui3arA8sE9b44c2m
         96gRRL5nEhlMHHFX5pLFlprTTZ0RjHhzmVoa461p+K/nylm4b53lANxYTHyhXMR4iLNf
         UkpXz92P7Hh8N3pCwUPHp3HNFGFumrTbNp3BVsQkIL/9fJJ+btTKSB9Dje+U4c7flZwD
         DUh1BdABb2wAU5oVwvQR2sFPbeVtoqYpLqTGLuUgk6BrwIVWu/XeZlIjxmPaETbuNEQ+
         CYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136132; x=1787740932;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4i/Wj7VbjVfeq660KhfTJWgWKQG02yPSN0FVJhBIXyM=;
        b=bU/SIBJ+Vlljvs5hLqiucPIasiA4V5UbOBsofw07XmvosF+S4mLqygeDr0jATjNZ57
         TsHb5bdvSY9Eb3gns4cNsv/In7ZfwtR25yJr7uHv03wbU4qvhJW6T00CL8c116cCE8EJ
         19VmTZYIuS8gnye3lrS1AwwKjddBekyUubUJapbHzQ8EXh6eDV2vYt//z0qZNMtVgmuj
         zJ5wxu+U+oaSE5jOQrh3zxHx8mnTaGvBmZWWQD8ZlWxihXrIzWFuW07TTvl16UubBrQE
         yJvilLcsG+9b8Qo0GD7di/JYK38GHoElfA12RRbFTMRmowz/QPw8qnB7FhdlR29yoibv
         Hm8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqKG/hnheDJ0NBRSdAnVc/0xk+zvxShsqqKKzzvGmeNtHdOpH3Dfic7At1J41oxShlO5tZYFCxUSwbFtPXW+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nTLuOnE5aaYuDA9Q8fanHR2iDKBT8v63gmHhPRrNYxn2bVAwIQ
	rHREDEWCZX5Khh8odZNpiDo7KraqbwoWME9u+2zDwZD0c9xJKb4QkznZ
X-Gm-Gg: AR+sD12SoDinlJq45Mdl++uUNKh/mrxGbOYdRX3VtleQ/ByAWELO0vRIKnZ8bKDVPSB
	y63Jvz7rPtLLQeeB3r2Kfsy4bHW4R/A1mz/i1+1tCoxxfUz86nheXn+kP1i7KvRJeR1cvix8DxZ
	MndU+5ukuLUQingCWUHZx+BevNw+dW790FHl+uH+Xq70j1N6b7D3B8JoBu6BNU4T7m+Fza/Puxm
	I2UiJdPYJSHxroElC1qXE7g53n8po8K6dvWUfIcPk4BDEaGHm/MVb7mCFkkiRRsv0TZBG7Wyuzy
	PQ1VuuVqjbxbkRLkc9ujq3iaC+RYgbO+W82ueM5WgKKNcq5PIHv62irriv/qpQmk/vq7NtHOCWT
	4b3J07+ZZS5Nq8sg6dZngOjFRBDr7gmw8JdlqECzMPjtAAqxK+OvGFGZ/P/s3sYGKZK3cmUYQTb
	ZAKNXkJNzaPDuBF5n+jpYXnRHmCeZvJrtL+uXtzDUVpDfGRL1WVOJ/L4sIjQzE3tpmdCjroZ23r
	X+xwUWOUqI0YDgn6lcJ3izP+YakyJ9EGqxX9zT2KUk=
X-Received: by 2002:a17:90b:17c5:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-395814cf6c4mr5225113a91.16.1787136132380;
        Wed, 19 Aug 2026 03:42:12 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb3069csm2609681a91.15.2026.08.19.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:42:11 -0700 (PDT)
Date: Wed, 19 Aug 2026 16:12:01 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, thuth@redhat.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aoWG-0xRUhzDiuqg@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260819084825.969116-1-mkchauras@gmail.com>
 <CANiq72n=C68iaxuLVR5dbuBpf2FLMGwH8wtB+d5sNgOTv4BQ7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n=C68iaxuLVR5dbuBpf2FLMGwH8wtB+d5sNgOTv4BQ7A@mail.gmail.com>

On Wed, Aug 19, 2026 at 12:02:01PM +0200, Miguel Ojeda wrote:
> On Wed, Aug 19, 2026 at 10:48 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > This brings powerpc into line with x86, arm64, s390, and riscv, all of
> > which already define ARCH_WARN_ASM and ARCH_WARN_REACHABLE.
> >
> > Suggested-by: FUJITA Tomonori <tomo@flapping.org>
> 
> Should this be Reported-by?
> 
The change itself is suggested by Tomonori so i was not sure.

Yeah there should be

Reported-by: Link Mauve <linkmauve@linkmauve.fr>
Closes: https://lore.kernel.org/all/anG67Q6Y59kDqh-c@desktop
Fixes: 73b741adb264 ("rust: Add PowerPC support")
> In addition, probably we want a Link to the original report, and a Fixes tag.
> 
> Ideally, please include the error message in the commit message -- it
> helps to triaging and also to search it later on etc.
> 
Sure i'll add the error to the commit message and send out a new
revision.


> Thanks!
> 
> Cheers,
> Miguel

Thanks for the quick review.

Regards,
Mukesh

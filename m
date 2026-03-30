Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3EC3A0B1C
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774904959; cv=none; b=qjPxvzcdMroaq3yhNrfw5YhcMQYObeACv5c2SvqnE9vJFhzhdY2Ps7g2wj/C1JlEngNsvEOG/EDq3NyQWiKBErI+7zkw5juEUGLYVPEfe7A6nCzYNJS47H2Mqn4xmUcvS78bDexns8oAzyEW9jOmkD5h2JoG18mkZXXEf15XBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774904959; c=relaxed/simple;
	bh=IMhQOsjCudR6+sxrPIeCmFwxdNjsHtb9hubGsjZ+tdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r17aJVXaMOrH+I4ZUmCUyFwNZtflW1RfQh/xKS5CDHhBxFtwVdKU+p9sHHaTlBo+VKz6bZ7IaJXhLhk6pRv+goH7UIw1rLzGFIu44lD2N+6I7FM3ZYNb3pm7EkddnJeu3XUFM41qRlZESvjf9vAZgFFeYdYAIDBrZmTsWFYZ1rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyPd92f7; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyPd92f7"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56cde757d3dso1662586e0c.2
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774904956; x=1775509756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zlsVcWSeeIpbPnsSYMwOt0k3yfDPRs+s8ihr0jHypXY=;
        b=cyPd92f72mVkOHnyJOupvn/nr+MHOXYDyT9jm+BMbOfAneyNkjZB7exQZ4o/6LJgTw
         Rq4a8+M+wagQspoja3Uf2WIhSOzAKOAYxIl6j4dEOqELrCEukKZRj/QAyKkGmz25UiF0
         dbJKPhh1boJqbJ1vnheKV5wYLhq+pWumN7gOKRfRBf2E3RBMphTa5xugNPI+D1ymIqSF
         JyJKeD71EbVJjgcUITF2/efjogftzTfrTmozr8sy5iFYDm/nIPhj/OCv5nQ7u+eNXyR7
         p8z+tXR9ZvPWR+d1ptYWzfrY0A7qlX4hrkccXSMASq2YLJU7Ctlug8cfXBxXkWzgw15g
         CL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904956; x=1775509756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlsVcWSeeIpbPnsSYMwOt0k3yfDPRs+s8ihr0jHypXY=;
        b=Qdm2Wc2sF20AmUvLsiLOr/eYDWqZHsgIDTSca9qdKmvJ/uPWU2bWhqyWbGHnbxk234
         P+BI+6WUyXXlSmJVEFLWjIIhlUfWfUlvoiMBV4/21vKXNWmSSbheQlE7xtTTgwtx08c4
         0gLsRe271hrI5c2oVWJ4rJkqSdoIEZLj5ux9FVdgaep5yv+9ygkhcJx4W9yNo6EOlquV
         gu9EQ0NjiK4ZnVx1kq5RTR5/Aes7AmDz7GMLQvZYxvb5bKJ7E+2c83ZC6dAsPvvzP34v
         Ljfw2/j10lf/pXxG1blNOCTKepCSZ/9kSKdkCdPbn/ypzMN3BoxBEM/P6Ys3vfj63+wM
         1HVw==
X-Forwarded-Encrypted: i=1; AJvYcCXWiLBQC8iEju5wSf0q2g94ZVQG/k9qWX1XwxXz/E9ya/hHjZD2rpNEUrwi51ht+9FSyXgcExvrdAPW5M86ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyljB5VDNPC5XO28vWUylphBAaiIfT08sn2tcjeg+BFu4Jo9R+n
	WD5XkIA6wbyUk6vKCGJiOyq8kcdHvT03XZhQgkgz21Qtki5D/Ib03gMT
X-Gm-Gg: ATEYQzy665tgeeifxSdrnYiDSEENIdfN78eG6vdZqFfMAiEGdE2IoBjfwl2ke1CmnWE
	0iSUo5nw9z/eZoqQGaEhhIRgx44QWMcbDwZx4taR+dEv7Uh9dbT38kdymTDl+T/LZbCT5vkmKNa
	G7y7A3xqxHATeu6Cvb8opH8sAaQx1UrXCiSS1558j0z0spFFdpHw9WwI+LqShh9mkGcLBRG1eMy
	ftbAAAvBBE34kzTQzpSzbtaawuI7OT0wZCxBvqZ3XrzI3v0ut5akmqpm/EZWqs69SrATNJUC5Ib
	llHBJL1YQnMQGx3oKDv1BETcCevqzmAz5cjZ/bIdPAI6eSMJt7u35ZvIFw2QKZMU+/4G0bCeFR+
	44+VihYClF6MGusPLHBFYCu1ySd9SC8dsB1JbVNXaK6+Zk8HRxiQ0MMD9cxl2KOTsY16KKPIUNx
	J5iDRfoKfgpTK7XTuOt7Biwx1OMrTE3c6MJeNJ
X-Received: by 2002:a05:6122:3c44:b0:56b:9ba4:1372 with SMTP id 71dfb90a1353d-56d4a5f8c0emr5672211e0c.9.1774904956234;
        Mon, 30 Mar 2026 14:09:16 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:d2a7::cebd? ([2001:871:22a:d2a7::cebd])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a333c9sm9989448e0c.13.2026.03.30.14.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 14:09:15 -0700 (PDT)
Message-ID: <f159850d-5fe6-4329-9703-b355305fd106@gmail.com>
Date: Mon, 30 Mar 2026 23:09:06 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Alice Ryhl <aliceryhl@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe
 <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
 a.hindborg@kernel.org, acourbot@nvidia.com, akpm@linux-foundation.org,
 anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net,
 johannes@sipsolutions.net, justinstitt@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org,
 mark.rutland@arm.com, mmaurer@google.com, morbo@google.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
 richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
 urezki@gmail.com
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
 <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/26/26 6:30 PM, Miguel Ojeda wrote:
> On Thu, Mar 26, 2026 at 4:18 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
>>
>> I'm not sure if this is still true, but I believe it used to be the case
>> that the -linux-gnueabi target has one behaviour for enums (fixed size)
>> whereas -none-eabi, the size of the type depends on the range of values
>> included in the enum.
>>
>> Certianly, when Arm Ltd were proposing EABI, EABI had the latter
>> behaviour, and I think there were cases where Linux used "enum" in
>> its UAPI.
> 
> Short enums? I see `c-enum-min-bits` in the armv7a-none-eabi built-in
> `rustc` target, and indeed:
> 
>     #![no_std]
> 
>     #[repr(C)]
>     enum T {
>         A,
>         B,
>     }
> 
>     pub static S: usize = core::mem::size_of::<T>();
> 
> is 1 for that one, and 4 for the other.

I guess we could use a custom target spec, but I'm not
sure if that is worth the hassle of adding another one.

Cheers,
Christian


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146429A30E
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091234; cv=none; b=Jy68gOdlduf87gMlXnz4mt+cnpCuB9LIr0BtkgzrIUNXRJUwUm7JVDasa9OXkSOEPIFRyHipLTSE0LOF7fk2Neg8HRtOVhuzBuYHrDrHJVZ0BhsjayZ80/KwSx5vpg+dnkfLSZJULBVkwwEGsOy/MnrliOuambjUWsGCStfD830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091234; c=relaxed/simple;
	bh=87tBszBBmgtC8Idw2n7m2p3GwBU7qIQ/w4/5FPRwImo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ix0QquyqFn1pR/1eLgg27x89bMOcbKivVXF1KDuqxfT0L1DxjIhqhNFeRewTxuNLWGs86iIfUwVG1Na4yAjHIgn4JmmlpLzQjhICPxRw9EDvhdSGKJ/P2WvE6cCkYE6MG3eLWHa48DWsyUwK4fKyqKkXZOA8QlEns0MGVO+u+G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FvSI2fup; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FvSI2fup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767091231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VmpAtI7HNajU2rnUGpstLYFrWBgny2fAjrQvEOTx4Ds=;
	b=FvSI2fupWqTmL/wSGd1oJpAgOn5yFY1IGKSeo7+t7axjSfedfzc1VUPagU5ZTc/3I2chK1
	iLOsPHyWyTWg8nd7HozhU96pHWU6DO1h4Yp0s2jch5geyrtqtizVb7J4UPmq1g6PuXoFeL
	MDUOeii7FWKDVhydYUBBncTAnaltBqs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-2KsDHh7qOaqW5CX6sE7v7w-1; Tue, 30 Dec 2025 05:40:30 -0500
X-MC-Unique: 2KsDHh7qOaqW5CX6sE7v7w-1
X-Mimecast-MFC-AGG-ID: 2KsDHh7qOaqW5CX6sE7v7w_1767091229
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-430ffc4dc83so10033748f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 02:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767091229; x=1767696029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmpAtI7HNajU2rnUGpstLYFrWBgny2fAjrQvEOTx4Ds=;
        b=WcRfseBgjjbNf5g2pKFW8f21DqYdoysDVuN5K9rgYdWvnXpEjONIPQnWdSnEPdemHM
         JNkuimQ29ERlwLgq/M38Dg/4oDHU70YVpmuLXWqid2FsnA3cc3HERvCMxhzb8dZs9B1C
         x1aKMhHVwZ+plyc7++wIy3AMXaZ0lySN9b9852N8t2pjWGN1mA9BpbQb8yWyd4EsDjH2
         uqQgw4vtkfWgniUYAYUEPYYL3x88BlM/bpAiFso4UZl2W0cVmSn2YlwQsEVD6T1Jt2pj
         C42gCHUzIBBpzrpEmIWB9+wU4ijI+u+1Sfjypb23dVEkkhCiNPAammYUB08m2/EN6pFt
         xz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXi1kagKBuOJL5C7NvcqhsBYLqbJSZvwMxSBsrzwhx1U7Y49ywj7fnHFGDW3rYy5y2mKhdh5+yx+tf2me9nww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBq2HdqDiwaZDqNQP8W0gXo5dFiyzw3Q/XkHBsoJtOuP+8C0Qg
	PjxQbOT0y+Wa6czwPs566LXlEoUFnwN26orE/biTE5PZ8xNpEWjLfFYD9WjK9WdXPZn+Cr/hyjL
	z3sALYz80zThsX4RhQiRwVhacGVB3jx0ZHrO9mbfPkZ9CJ3h9u0KSWUGUa5iZDioiUwt0
X-Gm-Gg: AY/fxX7HHMaKW53ciAGx4m7RxXgyjUIeXERgcYF7TqaL8079vC6endaLRJxmmwaMm/e
	sooRNiOidugKce0doLN/zOzZ6b4wG0NxJeGAseyEx3frEUH6qVtbcf6IX0BnztRqH3WyvK8GnGz
	0AQz0NouaqQ0ArjsT/cFBleQAhScUFeNgkmI/vuRDvlcQIy7TIT1Vjeoci+/K9JJhAnW6PNUTLn
	kUqsa8aegm+CXlvN9G+tN9hsAxUIJD5NmYiZUQWQOiSD4sSpj7N1g08/DFMZnzv9Hx+o0YTLmhM
	fk9XkZGchGsjsHOT/Gugb/xNauKsATQ3NrAk3pi7+Z07alklbliFFrhDSKl2I56j2MoSnMXc66X
	3ePmznaq6j86Z
X-Received: by 2002:a05:6000:2902:b0:431:8f8:7f2f with SMTP id ffacd0b85a97d-4324e4fdb21mr32991032f8f.34.1767091229427;
        Tue, 30 Dec 2025 02:40:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHod6TjYZ5kG7LXpsr8emcE2y+xSFRQY9/4WjR81R2ql5w776p6X0PQdjwwLyzZ0LZZR5XD/A==
X-Received: by 2002:a05:6000:2902:b0:431:8f8:7f2f with SMTP id ffacd0b85a97d-4324e4fdb21mr32990995f8f.34.1767091229026;
        Tue, 30 Dec 2025 02:40:29 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea8311fsm68260811f8f.28.2025.12.30.02.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 02:40:28 -0800 (PST)
Message-ID: <44fd3760-5a01-43b4-ae68-31e6d3c18dc3@redhat.com>
Date: Tue, 30 Dec 2025 11:40:26 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drivers: net: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Trevor Gross
 <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251222-cstr-net-v1-0-cd9e30a5467e@gmail.com>
 <20251222-cstr-net-v1-2-cd9e30a5467e@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251222-cstr-net-v1-2-cd9e30a5467e@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kSmViYcfQhKN2YechiqRQyoJjbo0wAk7EN-BKIWaeEw_1767091229
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/22/25 1:32 PM, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
> 
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/net/phy/ax88796b_rust.rs | 7 +++----
>  drivers/net/phy/qt2025.rs        | 5 ++---
>  2 files changed, 5 insertions(+), 7 deletions(-)

It's not clear to me if this is targeting the net-next tree. In such case:

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.


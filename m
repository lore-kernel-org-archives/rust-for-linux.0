Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC84185E5C
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 23:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718754176; cv=none; b=rFLJY8urXqzxpnJM+EfBEswzLvBVXPX6g2vfICww2PNmvyypoqD4tCVe/N7JuUSmH6EE96TcPosmModGrctbfsjUzxReM8G4BD3Hpo4u2sgsAs6kum2FsCp5lcOIc8fLrTK4j78dKtVKpNvSyLqcMKvRiqDMRee31AJvoMnarCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718754176; c=relaxed/simple;
	bh=O3Z2evdNPMBXT7admKZAc1Ne4tYdRPgWACHYuEqy2nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvQxtQVApgo3RC88peuAgItbPN6afvOb2M1146rCrFh651Z4DwFhQ9wRRJnuz65/X1JnYyFue1W3mQJis5YDVLfj1T69Ihnz4zlzTkg4Pf3IIITBNF4JsqDWQDCjmnJ6+FCUy9ljJdJECTp9jIS8HmavFUITIYfsUrziX+HmR6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gvjKHKgH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gvjKHKgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718754174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3Z2evdNPMBXT7admKZAc1Ne4tYdRPgWACHYuEqy2nE=;
	b=gvjKHKgHstZD0iCmQNPg5uoOQkdmvUiXaL80tR0FPVBTDVj2lk5Y3/TpNOcxt7uyGo9X1V
	V7sk7k+bosHbujhlsRTeXG89fVbJ9vwlsXnFU9+zm01OYIDEcQ4pactUCVJIoU6C8JGekV
	bf6NladAa5ykz5caBADZh6hhXfFzg1g=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-HyT5JLpkMsurx7GvURFCVg-1; Tue, 18 Jun 2024 19:42:52 -0400
X-MC-Unique: HyT5JLpkMsurx7GvURFCVg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ebe662e992so53939071fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 16:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718754171; x=1719358971;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3Z2evdNPMBXT7admKZAc1Ne4tYdRPgWACHYuEqy2nE=;
        b=EGe3y2yRo81YGI4qxnt7lRb/k7+OnAtkWIJVWQNNFz79p1YqVH+T/MCrJcE4JQ7yDO
         +I4HS4VC6pK+DYPPQqBmZzSTra6W2Z2rP0W6UqQjJUFBnT7R0WvhK58tIIH+DqdG/DLT
         rGz8+LvGyCq6UTCQRtNjnxN7bAsc3HKXBMxrfjeNParExrqnEzKv4mdZq2AJGsClPu8y
         ModS186falrnZmY4pAJCh6dnV/qM/qVC+eybJjFBPYCFf+kSC2heZH51V9iW4VR9QUeq
         VWH88hCY9LJ9W/vggxLMFN0YInkLOm4/8hunEhOT1RKbm86WxbLoKSsnKnnGoMbfJCRr
         dOPg==
X-Gm-Message-State: AOJu0Yx3Xv5MRs6mb+XkZLyh+DDwWv5cffc3GBySVecCXACP+raeDJoE
	qgnqpHkJjYKWl4E9UrUbuOICJE9Ta4qYHS7Z02zb14P8tiickAPiuJdeVyjzCSJnEKE4DLevkSI
	pLmKAzv8kNhG0+wQn2H+YMz6LWMm1RXzNPMS2mufuQKpZqqOibnX+zOyv0COcPrkx
X-Received: by 2002:a2e:2c1a:0:b0:2ea:edac:4886 with SMTP id 38308e7fff4ca-2ec3cffc4e1mr7588611fa.45.1718754171323;
        Tue, 18 Jun 2024 16:42:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXxWA0oSKg9/uHRxkYZqgQapFgTGUJtV9NxLiRf53cMqUzSCZPEdoUfvLiePJ4nZRU6sP21w==
X-Received: by 2002:a2e:2c1a:0:b0:2ea:edac:4886 with SMTP id 38308e7fff4ca-2ec3cffc4e1mr7588381fa.45.1718754170863;
        Tue, 18 Jun 2024 16:42:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f8be0c69sm208261285e9.33.2024.06.18.16.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 16:42:50 -0700 (PDT)
Message-ID: <c67afe11-82b4-4ef5-8ef1-cfed502b545f@redhat.com>
Date: Wed, 19 Jun 2024 01:42:49 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Device / Driver and PCI Rust abstractions
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, robh@kernel.org, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240618233324.14217-1-dakr@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

https://lore.kernel.org/lkml/20240618234025.15036-1-dakr@redhat.com/


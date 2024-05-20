Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78414138497
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716226230; cv=none; b=dj28qXohza1beO63/q2ccaHdzTY1y4niqa6z1xt9n7/L6pisjiqkvvWwAhBEsBNyRpPB1HzlrQyHTROBE1FHJMgsm0+bjyA9QUZSQmOqND9YOyEZBiWh+VLJfEy4Y0Mcw4okl2LVV1kFB9EGC2zHzBzrTyx/ydpXrOOrN1NrM/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716226230; c=relaxed/simple;
	bh=JEiGpueOgc8AoSq/Mo1H+WaHd62XVwbqvhNsyZDlqOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=VMK/O+v1pvZhnn54vAb+GV3PvFRz0/dbPrZUN1dcDPHsKmz/I9y4b8OGCG1wtgRwwWqnEi7oGi7OV7LViTziRoxIx+oefiZmYcZQBsQB9Pl3TRaWStxjwW3R6V6GV3pAbi0AJPRwxUfJ78+qqFI3UhQpvf/S+HvL+SWjGuACK40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EG3sBb/S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EG3sBb/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716226228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JEiGpueOgc8AoSq/Mo1H+WaHd62XVwbqvhNsyZDlqOM=;
	b=EG3sBb/SMJyvMcXfMXK3Cscco1BGLSd1w5rxoTgtJJOQ4msIOSB4xhye0No29gDIIymN8G
	3ujbdX52AJtSUBuhxUuZj0pqE2qEiqi3yLH4D6k06Y/GCxCren9xCTSoDxz2sHUFs/KtML
	n3F0OmT2eO5q/TdFQqirjpn1BOUm2x0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-f8GDb759OG2gopRInFouWg-1; Mon, 20 May 2024 13:30:27 -0400
X-MC-Unique: f8GDb759OG2gopRInFouWg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-41feab38d16so47843015e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716226226; x=1716831026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEiGpueOgc8AoSq/Mo1H+WaHd62XVwbqvhNsyZDlqOM=;
        b=qz4DSZh5l3+6Y5d6fUjq8dkoJrIWjpPJtBt89yFv66oFQlfZsK7WaMerzRllPd2VfA
         2eKdNFh12HcU4V9jDsXHIWLVcnhwnmH/kZjRUujcSNVHT53S0NoVjlt1HBhh0fK1WxSU
         GfwQijIJ7ZghdNIeMDBml2BZsQwlyMCc71xnD/bX43iKhzmXjt96maeLLRFT8fAYPG2O
         09klWEUERF/IKBN/E2Tj+++nW3hlsz7rE2Fn5sQnciy2KfYMCqMKthn2XryGwIeG4HAM
         omktoF9APmW8ivzYeQetoNlJbx64OaQhO6eHMVBoPAu6zcRYzVSTnq+3aqXF9wtzVprt
         PTZQ==
X-Gm-Message-State: AOJu0Yxx5TqSdPpLPyJq17XeZ6/y3rY4AokTFKHTK8QHjbUBs0knMk4w
	EEQw+uhL2pcmX5E1+zWN9oRNWkxQeALmhnYRaVoix1yI5qIUV8lH36IN9AEog39qQ0vPvEWJ3JJ
	pwoynqTo2p813oz8BUkhhJt1zlgGANZDznq8NdVYdHOs7jM9r2/ZUJcGxwKulf79O
X-Received: by 2002:a05:600c:46d3:b0:41b:6753:30be with SMTP id 5b1f17b1804b1-41fead6cf75mr264210105e9.38.1716226225960;
        Mon, 20 May 2024 10:30:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLMmMEs7oji54nqFuMmTpApMjr4YzjaiuZ5JCC7hPNaB7rGOq5cC8QRnepVmquMDWE6o0wJg==
X-Received: by 2002:a05:600c:46d3:b0:41b:6753:30be with SMTP id 5b1f17b1804b1-41fead6cf75mr264209785e9.38.1716226225566;
        Mon, 20 May 2024 10:30:25 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-420e88b71a2sm69373295e9.31.2024.05.20.10.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:30:25 -0700 (PDT)
Date: Mon, 20 May 2024 19:30:22 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, fujita.tomonori@gmail.com, lina@asahilina.net,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: Re: Device / Driver and PCI Rust abstractions
Message-ID: <ZkuIrveTDOCei2lM@cassiopeiae>
References: <20240520172059.181256-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

https://lore.kernel.org/rust-for-linux/20240520172554.182094-1-dakr@redhat.com/


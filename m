Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BF4433BA2
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619976; cv=none; b=hMl2lFXtkCRmfMJCYv/hBlxjywEvAoDZEUjN3clVbyhgnfsI9Ar0JGOqfDP8v/F8c7lBua3nnOWkO1gfT2wax/fNLVqjnCrHTBC9cazx4pWkctfglExXMFhT0452rxwLZq33vB3bSKb3Rifj1j7uXHMr033ZiFYLzUs0NkNkQvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619976; c=relaxed/simple;
	bh=dau4m55i0N+huU1Tx4LV5VNIWA7SxLqAMiCgmbSBsQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=N+5ry8EKzCk2zgoEAlnLcKt0kEOfHYmo+IbgOe6Wokl/ez4xl4J0UMTyVKVVq8Mg57P+LTCpH1ngkcaTkJ/lL72L5OsofAoiMZHJHXQsMhQ2IvKtB3rxtOnO7M1KD8dsy7dbGtI6VF5mHwtPwRt5C/MuN//cPR7RjylFTDM5fhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dIlOrAVp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dIlOrAVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784619974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Ais/X6bRzcXYsevthemLaBtrh2axhIC1Q39swas2MM=;
	b=dIlOrAVp0Ji2V5uTVEmBpiea9pMbIx6M+OOB5ZyTDB9+QstjgsdxLFRwYx+IDMirRWlz3A
	I5t7Bbn21g1YWyf9E3TJo3/Ve7vdCvvZvzEhgj36aQStbhoRc9XqkdQ120s9gPrVDSdswn
	kH67gkVnw4dLHFn2v6eWHyf1mQmyLfM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-m8IrxrkWM9Gbu_Iq-Ptn7w-1; Tue, 21 Jul 2026 03:46:13 -0400
X-MC-Unique: m8IrxrkWM9Gbu_Iq-Ptn7w-1
X-Mimecast-MFC-AGG-ID: m8IrxrkWM9Gbu_Iq-Ptn7w_1784619972
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f6db77430so1957909f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 00:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619972; x=1785224772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Ais/X6bRzcXYsevthemLaBtrh2axhIC1Q39swas2MM=;
        b=a2J1zQIlRyN/RPRF6+1lzrtjrNeZXjxq88sWbrGWRma/G1GLuspLPXcMDqw5QSJ83k
         SShZPPIOOH1trEhu3qNWc7YQR+yvIC5TeULqRytbGBG5rm/aQ8EZ/xJjda/gV7uN8oEv
         IkJPu5OsZGB99bifkIcpfA+Ntfj5+iR/zD4yrd4118KY4voPkavXwt7HThZiBkO4JDV5
         fRkbl4AhZRqI2vAdAWIvzPbMP3rQLu5nL6YDfz06GE/K57n9M3DFF6EkRIV+YJ5uNXWf
         6buokLKCHNWl7W+HGqAPBlbgJxg/y3InhG0cwTRyD6vThsXf0L8KIARwhZIWDGf4mDSj
         hNAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYOZ5+pjsjw0wTPP0P2l7GtHXrKmeiJv6cnzwplwc6PV4Tex3wwonYBn/hgRwWgVGnBerImQQe88ajfLjx2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPBvDyYoMdSsPKGENljzNds1SKk+BwV5axNMtuctJLe0SXCwYN
	YbqsIBVFJp8xO747cK2XAMb33/JcqK687PEPCIM8WnKCsdzbu4ikE2LOUCssJseVpY2qEjmsgZZ
	p5uOhWXTxzHosiCT1SXKkNFDcVzKkOUHtq1kvMA/SrIRrjmNWOEodgpfL205FKlabZ4FY
X-Gm-Gg: AfdE7cn9mFBqmyb+biMgXrh1j4IiXEZelnmjm6yHi5AE/D8ot3ZS1lQljwWQ5vAY8nn
	o884vo9oxdgUGDtQ1v2c+Pxvv8J53F0T5w+R96ldc12VOYv0vS49dr7sKOcML5pAPJf8OjwZNQU
	pG8+A2ltsbLFRH6GkYLXL4JhS8JIUjtReHQrsDOjc2QjMDg92IZvXQDpZERUQznI/dWzR17bRoD
	G8B7NgCknvwx3aG9QvVvOix/QMsSxLVSm/i0PScJRof12P+wHii+lT9p4bpS58fDo8UpWfkVehE
	S8Y8aJyBJ215sSa+QRrmpM4z+ZK87Nfoxr46Erf6kLWQB87cTUAFbFFG7zUIHAbCKR7gjUjELFj
	JaAVRwryZTiUIwN1wv+CaQesv9+zmCYGve8K6IhBkg7hPHDWpcg==
X-Received: by 2002:a05:600c:3515:b0:495:5b4a:53c9 with SMTP id 5b1f17b1804b1-4955b95bfbbmr89971175e9.39.1784619971810;
        Tue, 21 Jul 2026 00:46:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3515:b0:495:5b4a:53c9 with SMTP id 5b1f17b1804b1-4955b95bfbbmr89970765e9.39.1784619971248;
        Tue, 21 Jul 2026 00:46:11 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-135-65.retail.telecomitalia.it. [82.53.135.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ce4sm37180764f8f.8.2026.07.21.00.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:46:10 -0700 (PDT)
Date: Tue, 21 Jul 2026 09:46:00 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Manos Pitsidianakis <manos@pitsidianak.is>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Peter Hilber <peter.hilber@oss.qualcomm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 0/6] Add Rust virtio bindings and sample device
Message-ID: <al8isqIL6gwGlPc0@sgarzare-redhat>
References: <20260510-rust-virtio-v3-0-1427f14d67e1@pitsidianak.is>
 <tiiht3.22qk83rct1pd@pitsidianak.is>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <tiiht3.22qk83rct1pd@pitsidianak.is>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Rl5ZQYMDapnpTwbjOb2IOLjHjaJLyL8rMNySn1qaxc_1784619972
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Jul 21, 2026 at 09:21:15AM +0300, Manos Pitsidianakis wrote:
>Ping.
>
>I have a different version of the series WIP with a virtio-rng instead 
>of virtio-rtc, based on https://lore.kernel.org/lkml/20260529-rust-hw_random-virtio-rng-v1-0-b3153dd90311@pitsidianak.is/ 
>(which needs a v2 also)
>
>But since this series hasn't gotten any feedback on the virtio part, 
>I'd like to ask if there is any before respinning.

Sorry I haven't replied until now, but I haven't been able to find the 
time to take a look. I'm very interested in seeing Rust used in virtio 
drivers, and I'd be happy to help maintain them.

I'll send you my feedback within the next few days.

Thanks for your work!
Stefano


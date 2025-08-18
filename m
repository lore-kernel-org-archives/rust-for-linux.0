Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1151322755
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 13:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525584; cv=none; b=Jl+vSJNyZg7GAETcx/DN9GYDm/8AfntndeDzCWaEWCvmGG31QejuMqzLNo7UOh0xBAlJ/6D1/91+GOoriUYLq6EKPrzKF8eqPKO6kw1zpLYhYCCE6ESxSqytH6NLxBodp6XvHKVXQVyO+pncRvbGoOMkrigD+sGlB9ajJNW+7Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525584; c=relaxed/simple;
	bh=CiNgOZGMixsgD0/6qrG9yAA2HxAX+DcIvAlaTGUjvLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=Uq+l4dT8NoQGqvuEOX/PXLfN9VM4vN6r1IeUvuzP/DNsdhfV8MJDSUVj77pSnXHwRe/4AtZrnGrmnuN3KQ9LqOMK9OVF4W/tbgtxQM1rJcSuzL0TsJJZNnjhPzAFL0vXjgFlbAcVScs0xnWLF8zOf4UbOzNATgNXxscyxkXTAgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYzhSHD9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYzhSHD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755525581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kyCc4a5+AO/yig/KWWz+VAyj7gnO9/iimj/mS2PVAmg=;
	b=KYzhSHD9oZowzaBMDf7YPkD1Fkrq+eLADatN6Q7dXLIDaaIi2H7YIO2Del5phKqDJ652JW
	NOtp2hgP9EP/mQBgAOgTQI8AaRMetlbafKqUkQpMpnAhVeuJM3dNMDT4CVC7rfjJl5Re/6
	D976c/kcNSAfL8t49W4DGwSRrHFwl+o=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-44Nv12ygMUOmfldQNmYgqQ-1; Mon, 18 Aug 2025 09:59:38 -0400
X-MC-Unique: 44Nv12ygMUOmfldQNmYgqQ-1
X-Mimecast-MFC-AGG-ID: 44Nv12ygMUOmfldQNmYgqQ_1755525577
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32326e017eeso4105656a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 06:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755525577; x=1756130377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyCc4a5+AO/yig/KWWz+VAyj7gnO9/iimj/mS2PVAmg=;
        b=hOcBpiqC9BsuKIJj2zo0vO/oTklfZ6b4InB+mLNltj/ujUx59DdA2nriotgXAVjLTf
         UiAJ2GNPrchWyZi5kEh1+BNiR3wV7Nph7u/RocFClZSgM20hfvIN8Loan8NpFf1bENNA
         +G04QXqpFbnEjhlJ3lUxkYUYFYGE2xLSSz0OeZZ2I6cgP3L3rbomvvdUfDebSfouwY46
         f9tKVTVNW/BShK9BhIdhk/SfyCjb2rk0lKPPSvXPPu3paK+03seu5RFzFQ8X9pN+qYpI
         GaEpw65JOMOrYh9hXDkKpxtwUMNRu/ykQ6w/Sg4VYtVe4WS3Jc9y2L+tKOz4T4zZvb/c
         7Ttw==
X-Forwarded-Encrypted: i=1; AJvYcCVgrEgJwiDg2kyGW+lHKwyygOq0PwaZi3pYcOkv5W2Ys9W4KHmFjMIie0rU5j9BgPHcZD543Ub0OLVZFDVNiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK1eyM7BfX3hJr0ResPs+uBOec8iMnyl3KDo4Atoxt4lhsmTvJ
	fz2cSsnLBgE9vsBjNQV2cz4yQisX+/MLhvOKM27XYhQ9EY1X6oa1EG6pTaTTirSO5j686jrp9Ec
	nFgA8DY5YXO5252Kj9rXLbWoaHOk2cVdHjB0ZbuTNLTuOzRMbtbUedM9XyilWhsCj+lpn
X-Gm-Gg: ASbGnctkiatXABg23bi14NUdVpe7+I0KWyHYC3xiwhsan+20lOQN2xhnyKGz4InivEI
	8gn6DTsSrrcIRAi/m14gEADyrl5Qza7Zkh6RcacfgGOCfUVGxnVPencsxwIRGwKmI8NILafUQ34
	E5JKCT9UZ/dAN6VEIyxLQv+LwYHTUiHgDHzzPPVU98vETE5CV5Ly8vmSsND0pl4Eyfh2rewq+Sf
	QhxJ4/E5NCZEnHaLdJB7qO16kL0ytT80rWMjWOWP0zziBdYsIA50kKzvSpQ9+l2k/HLGSDQpSh1
	1dvQDy1Gbez6xdp2LxgfVczNemdCRx14+A==
X-Received: by 2002:a17:90a:dfc4:b0:321:d071:96a2 with SMTP id 98e67ed59e1d1-32341125b39mr20287914a91.0.1755525577042;
        Mon, 18 Aug 2025 06:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEFZhqlZ8fij0sRgHmfXSCb3Qy2WxDI2YZmEvN4xLfCSTRfJG4cO4WUHjpLbXmfR2jjNnVBw==
X-Received: by 2002:a17:90a:dfc4:b0:321:d071:96a2 with SMTP id 98e67ed59e1d1-32341125b39mr20287875a91.0.1755525576654;
        Mon, 18 Aug 2025 06:59:36 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d60978fsm8269896a12.26.2025.08.18.06.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 06:59:35 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	lee@kernel.org
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rust-next 0/2] Add llseek support to miscdevice and samples
Date: Mon, 18 Aug 2025 22:58:37 +0900
Message-ID: <20250818135846.133722-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OTN-3AMKZ0ta7ao0d5wqGDGqJY_y8bhxZi2eYTGLHZI_1755525577
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This patch series introduces support for the llseek file operation to
the Rust miscdevice abstraction.

The first patch, rust: miscdevice: add llseek support, extends the
MiscDevice trait with a new llseek method.

The second patch, rust: samples: miscdevice: add lseek samples, add a
simple example of how to use the new llseek feature. As currently the
MiscDevice trait does not support any read/write file operation yet, the
sample is fundamental one. 

Ryosuke Yasuoka (2):
  rust: miscdevice: add llseek support
  rust: samples: miscdevice: add lseek samples

 rust/kernel/miscdevice.rs        | 36 +++++++++++++++++
 samples/rust/rust_misc_device.rs | 68 ++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.50.1


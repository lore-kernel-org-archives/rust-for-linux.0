Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D7D1CAA98
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 23:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737590064; cv=none; b=T+OLUyfUE6CytOVVeVdr46J4ZhUTMjoL7cjhidLam+iJOxvunL9QObpl/U2Zh48M4FEZdfz8fZ7eUvy9D3Pztv6nq5q6vYXuQxd2bOVA0LWNU5p2K/pBgRd5fQblfl3QYNUdrxcDLvTBMcHDAfa0g/AFfMoPSosPy0Ho8Nz5HM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737590064; c=relaxed/simple;
	bh=u/5kBhVahoi2rURQ4qke5LtU8tarBM5XiEebR8hE7/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lHlluxaC2T+Ygo0bIyvxOSkNI4e+Lta7sgsRkdcZhPNUdzRxPihvZkv0E9NFEhmYNduwKu9M018Vp3lopYs6HbPQJws3fF3fEih59NsXwfqx0qpypKqXfblkXaN9e0KnWxJncvr6MTkQ2M6VKW2dRpdiDpJYtOLQ6am45W8h14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PW0b/vKo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PW0b/vKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737590062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L/qtwcGblqFn+akPVo5Mm3Sp8lH0HwbJjJZg19Hnjfk=;
	b=PW0b/vKoFU+EZhaz2MpwUOiCItn6U894XRNmrTWWG4rWi/jKMoJJLHbp0r4GOol4Y5QQDw
	OUcK9EBjmRcXsYuZ9mvdkUE1TKwu9Y57uCYLuyPb8sHrgfWqgdZVzSfsWd4zllpfmjXbTq
	U5IU9my0oLO6qDTb5UYDJm9XDs6MuWo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-maMvBrGfMj69bODEAytZQQ-1; Wed,
 22 Jan 2025 18:54:18 -0500
X-MC-Unique: maMvBrGfMj69bODEAytZQQ-1
X-Mimecast-MFC-AGG-ID: maMvBrGfMj69bODEAytZQQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 470E81956080;
	Wed, 22 Jan 2025 23:54:17 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.57])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 51D6719560AA;
	Wed, 22 Jan 2025 23:54:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 0/2] rust/kernel: Add bindings for manually creating devices
Date: Wed, 22 Jan 2025 18:49:20 -0500
Message-ID: <20250122235340.2145383-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

As many of you are probably aware, there's a number of kernel modules in
the Linux kernel that don't actually probe a device on a bus - but
instead simply create a virtual platform device. One such example is the
virmidi driver (sound/drivers/virmidi.c) These patches add the
ability to do this with our current platform device bindings for rust.

The main usecase for this is the WIP driver, rvkms:

https://patchwork.freedesktop.org/series/131522/

Lyude Paul (2):
  rust/kernel: Add platform::Device::from_raw()
  rust/kernel: Add platform::ModuleDevice

 rust/kernel/platform.rs | 111 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 2 deletions(-)


base-commit: b323d8e7bc03d27dec646bfdccb7d1a92411f189
-- 
2.47.1


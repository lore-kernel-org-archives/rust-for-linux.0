Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FC224888E
	for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748421279; cv=none; b=E0BbKPasnh7j7FATNR6UWSuNaFt8P7ZSSqPxY82mifszKV5AcBKhF/dcMyDeg5y2SV7zwln2CABcHvP0iYZPqpLBST2DAdzkSHl5SfrtLbR4J9lsVpa7zOuVV6fLha8Mv/b6Eh7/KQIaojhV/BU/RfrrNeNWFSZP7hI20deehjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748421279; c=relaxed/simple;
	bh=WuwyUAHqnp7HPv0q9YY9o8U6CvTjARcWIkJ++XQwOv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=oXpPe9k23CbCZuajGu37JbpSW24NBnUiCHAr540TZhTlMzgz7HpFTOsZHfVoLo53OjWkdwvIjzhlfvgVJoOVoB1nTssCiTklNzfL3jW73c9mmZAvrG9mh7+9d8uh3ZhLqML8P23vKq8DE9BJn5wbbejcMznzmVdSlD3+uWN31zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IcXhovD2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IcXhovD2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748421275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U4i+JqyZ/XZ2/PTdI6CeFGM3MJ6lxIFb7tc48utqptU=;
	b=IcXhovD21haygbfd6cq4dhCzvl1G/pItkry1lv0BgzKzAayCICHp7V35XS8L45UkUOMmI9
	txLjeBF7UdyODpP6qUXlWQnl2XPZh182E+fcpdDIQEP9WhM6Yc+bUXQdo64SJpGB2MWxJz
	3AwozQvXT56DQdG3Gd0tBqBdU4rn6Mw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-BTeXcapyM8G-pqX4wDPtmQ-1; Wed, 28 May 2025 04:34:34 -0400
X-MC-Unique: BTeXcapyM8G-pqX4wDPtmQ-1
X-Mimecast-MFC-AGG-ID: BTeXcapyM8G-pqX4wDPtmQ_1748421273
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac79e4764e5so435263366b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 01:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748421273; x=1749026073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4i+JqyZ/XZ2/PTdI6CeFGM3MJ6lxIFb7tc48utqptU=;
        b=B4Kj+8GKKTbW+XXZ8bcsNSZNw0OvdA2dO+kvYazoTjPmnLK4vwuBDmHfRT8ozID7yS
         ggC3396AK6wA/HyB1YIM/qo3eSDTrYd8Bq4e9O7cr6VTuZkv3y1LNkn23pdLLYwT4eLq
         6YV5jRzBKkQyGyy6xZYTyf9S3CjfmVmvSbodbFv3ysdLKPAPMYk63kZsbWoctD9YzVq8
         mmOTVn+OW8BLcWEZ4QIySXnygaVv249yPRi8uCZ9D2q7X0KA+lUVvMADbrLY2N0JuQ50
         qLCp4IBPI+qXyfQX58fyyPsXaIbp9Mwvrw59bUgmVVG1jwnhzxnkSkd3YBai97dj72Cs
         wWmQ==
X-Gm-Message-State: AOJu0YyUDp8z4mszqDeUmjaWSEJcs8KMnuVT02tJxZn++tm9uxzXkRhS
	zAgpcX6UgQJnIhYUqfN8+qB8hmKCBQXJMjWEBaTBtNcXzFl15iVLBB7/u+apblo4MVckip0PXca
	0sf+wCAJ0ZDR1elMoFtgEzOTW3e69VkaTNGwBYpW+tFDqqSLeZj5FVJD4ynZpkFT92HxR
X-Gm-Gg: ASbGnctrHiBYFZdPDAUL93bgNI8rrahZ6zpcy9FRsUYwKzwC/bnqPKITy+6I4+URH2p
	ifCpZeScsJymyUKBvTbTruf1qU/Ci5almYX5tjJ9QuCb/b5ddp73YcQMWu/JggA6uRof3+xPnFv
	O/tABfbHdqrnTD7dPF475FOlAWA4+vgAxjol1Mztahs2rJYzqQqsSnzReShyDzRq+K9SLK7swji
	4QB6byk2U6LV4Jeg171IX7ovEitkyozYPevyjKT5lxs47ZHMz32vt70nwdttLY4LWub6L1IswSI
	dx2EHGdYKF4mGg==
X-Received: by 2002:a17:907:944c:b0:ad8:9988:44d2 with SMTP id a640c23a62f3a-ad899884717mr339412266b.20.1748421273165;
        Wed, 28 May 2025 01:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4e2bHjQQ64E6JdYrHpC7X4lCExyEp/3G8BfrYRE/V4IpI0prysNOJc41oeaxS+qaPAGw0SA==
X-Received: by 2002:a17:907:944c:b0:ad8:9988:44d2 with SMTP id a640c23a62f3a-ad899884717mr339410266b.20.1748421272788;
        Wed, 28 May 2025 01:34:32 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a19acd7esm70875766b.11.2025.05.28.01.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:34:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org,
	ojeda@kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] rust: add helper for mutex_trylock
Date: Wed, 28 May 2025 10:34:30 +0200
Message-ID: <20250528083431.1875345-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pMRgMNq6xPmJ0EypivNKovKs9FUjnaZHOiL65juzvLw_1748421273
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

After commit c5b6ababd21a ("locking/mutex: implement mutex_trylock_nested",
currently in the KVM tree) mutex_trylock() will be a macro when lockdep is
enabled.  Rust therefore needs the corresponding helper.  Just add it and
the rust/bindings/bindings_helpers_generated.rs Makefile rules will do
their thing.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
        Ok to apply to the KVM tree?

 rust/helpers/mutex.c                               |   5 +++++
 1 files changed, 5 insertions(+)

diff a/rust/helpers/mutex.c b/rust/helpers/mutex.c
index 06575553eda5,06575553eda5..9ab29104bee1
--- a/rust/helpers/mutex.c
+++ b/rust/helpers/mutex.c
@@ -7,6 +7,11 @@ void rust_helper_mutex_lock(struct mute
 	mutex_lock(lock);
 }
 
+int rust_helper_mutex_trylock(struct mutex *lock)
+{
+	return mutex_trylock(lock);
+}
+
 void rust_helper___mutex_init(struct mutex *mutex, const char *name,
 			      struct lock_class_key *key)
 {


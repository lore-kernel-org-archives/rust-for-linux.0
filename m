Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65D714AD35
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 13:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718803273; cv=none; b=UJ5JWNKBEB+ACydqL9OJhyHmElL5zEJwsgHfqbRx+MaKfpi73Ju7GFjTeW5DWJTxrrRCXM8p2DLTQQYp7O5EKhYo1SH96XmpOCY0vQttu+jUz5shr7WXd731DG8KbbmMN7oBJftOylNlOjAy1pLZEL4K/b2IQv74PGAWnoPbeVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718803273; c=relaxed/simple;
	bh=r7JK+ojeJzz+ITwNKEu20e+lIYE4Nz4rAa+kLRpPCHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CU+f0qw+GDr+hVwsskvfTjcZ6HLtu65BdaXFUBI784eOlXnakZGF56oSqZ8Om4FRm3gyyAy/6b0eaTPpcVT1TNJ0TyOo3f+VcfqsWdshsFc4dRdz3wrnyQ+7A/lf3Y4mRAlr/UwYb2yZXRwXjvjYDgaX6xUo75kfhokXyXPRaFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZkqIai58; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZkqIai58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718803270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVUc+CEwoyjb/GFZAG0m5bh7U/Mt7pB/alNJ5Y2rN30=;
	b=ZkqIai58hFLoON16gRWnbcUbkTnn0ZccgETZZp0HJR9NXS16NGfXfZ0mIlrut2S+5lTcQt
	ILsRSbqXIAdGdxH0gBozWjQ5T/U0vrHD+m1/l6hbsoGpOrW1P/fEsf6x2Sh++MoEczEVHQ
	kFprx+ojiTz1+Mr6fY7McOwsz6nEQyY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-vSZ0dNrVNf6kcmWnLJOzDA-1; Wed, 19 Jun 2024 09:21:09 -0400
X-MC-Unique: vSZ0dNrVNf6kcmWnLJOzDA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-35f06558bc3so4551161f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 06:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718803268; x=1719408068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVUc+CEwoyjb/GFZAG0m5bh7U/Mt7pB/alNJ5Y2rN30=;
        b=Ic33dEtgubEdvDenFih5/NzPIrpd1JsQlxa/srNhQWlRFcLNkvjOy/tuz5Tf9MmEC8
         8rjnbX4J3trHkcfwDrNLavv3/nVDDx4/K4nOBu8BmUImJHfbcwMiuuI00WZz7DFlHj0G
         qb2XJqWp7QYZz11XrCAIeRbtAr37ypMVgJlOWmr0fSnEZETcuGDU10sA69plw3pNOeFS
         OBwVoz4g5kPlrWLDqbXAg4j0kTv3ub1Kr6Gk7EAW9qfn2HPBtUBnAmAxyrvSNC9wx7kJ
         vfwC/oBRgeXRE8koVWyNjNSD2jfeJ8xvyTmIAGGkjIiRTuHPLCg0cbGPy69bL2QwZw7L
         /JgA==
X-Forwarded-Encrypted: i=1; AJvYcCVjIMbAdmSQQIeNozxIaFzr+VjwZiVSEHPIrMOoiyA/bG90i9Pnn+I45nBGbu+ZhqPAf0flI+mgzoVXBdWmSMQjbrhWS85Tr6Mc9dRkhLQ=
X-Gm-Message-State: AOJu0YzhhsMTpnhudO7t81TjWkH2uEYcljyNAMcrCh32EG4TUtdjLPHx
	toQx+Y3rJC5G57k2wiyOJz7gTlspnZnVyyHCcLaFgkIjxspTasL3MxiYcEZYOhHGYNuIqGu+/kr
	O4SMSzJA5/7v+xR1DVbI6GnE9EC9+QdndN8GUjqkZ8853vl83PEYeSmlZutUY/8Lt
X-Received: by 2002:a5d:680a:0:b0:362:69f1:a08 with SMTP id ffacd0b85a97d-363175b8321mr1692296f8f.19.1718803268432;
        Wed, 19 Jun 2024 06:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdSrprgbJVizfzP3Lh3e2ypK5PlSphzExI5JfLf6vuuDdd27R8n5w8Z2hqucadLKqzsHlOzg==
X-Received: by 2002:a5d:680a:0:b0:362:69f1:a08 with SMTP id ffacd0b85a97d-363175b8321mr1692281f8f.19.1718803268131;
        Wed, 19 Jun 2024 06:21:08 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750935ecsm17282204f8f.3.2024.06.19.06.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:21:07 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: mcgrof@kernel.org,
	russ.weight@linux.dev,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 2/3] MAINTAINERS: add Rust FW abstractions to FIRMWARE LOADER
Date: Wed, 19 Jun 2024 15:20:13 +0200
Message-ID: <20240619132029.59296-2-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240619132029.59296-1-dakr@redhat.com>
References: <20240619132029.59296-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add missing file path of the Rust abstractions to the maintainers entry,
until we can move it to 'drivers/base/firmware_loader/'.

CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Russ Weight <russ.weight@linux.dev>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf9c9221c388..38e7e0edd9b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8573,6 +8573,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/firmware_class/
 F:	drivers/base/firmware_loader/
+F:	rust/kernel/firmware.rs
 F:	include/linux/firmware.h
 
 FLEXTIMER FTM-QUADDEC DRIVER
-- 
2.45.1


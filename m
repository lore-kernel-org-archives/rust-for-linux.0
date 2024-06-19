Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DFA143C4E
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718803278; cv=none; b=BgzyX1Vps7tm4J6Ne1Q8kuoD0+M2+j/osS81hlT5O2Vj1POmfR1DhGJgcnXMI81/S3KHSSPD29LOdOc5Rs/xb71O44FKRWevgGB9ZOyAPdZ6jx51PLPTpozuIEXrLO+/i7IfArWpl8DA1F7G9TQXP72fnkxRXqx34w5e3vRhQkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718803278; c=relaxed/simple;
	bh=O7y/8GQKJpL9pypMRDSGZHFznl5aYJrfBDozLuBVJG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DvEMTiwLd7sHzyYki01wagtqd7jNOCfdxblICgeh2sNuAIdRaBV03ESSRtKo8LymNHcRmyKA5VnbveuMszgCLczfCjR+8uQvJi1avUea5WVU4HcjqKFhOaNRamvvvRUPAxzJpm/trfOlkw3RCoXoV3pDn2Zs78iQVwP02UpPho4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jHw78+S4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jHw78+S4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718803275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vVXcCL6bH3hJLBrtW5nul9is0NHqTNh55v2IFf+anwo=;
	b=jHw78+S4PUaad8zbhhAvrz/xd44YHLKe5Xa0Ette2JiaJKzy2rR+8HhVsg7XQFezwZ21Y5
	+f8uQGeo/mz15o0ks97PiZzEuuTItVD2uTrNzx0ybYNJ0OYLeDZ3esUw1LtQ2xHDY3DIfQ
	jd0B6yRDxyFAgaf18+jfpkXHB5p8IKc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-rj5zf9niM0Wiu2fOAJOD6Q-1; Wed, 19 Jun 2024 09:21:13 -0400
X-MC-Unique: rj5zf9niM0Wiu2fOAJOD6Q-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-421f43ddc2aso41037325e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 06:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718803272; x=1719408072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVXcCL6bH3hJLBrtW5nul9is0NHqTNh55v2IFf+anwo=;
        b=EXgmlRrgJbgL2TZySA7P4op+EDzJ1bX3EDVdAaNJLQrCg9RYO0Yd6hfFx7rBjDkW6o
         zcZivMarB2iNI5JZfbc+95NQ2cUX6rBMZ9FfEfPqJXNhyeqLF/sXxQH3Cs28gicML3rT
         xQQum1MYSg+O0wl9Yc+7LTLeID8/nTi21Ol1il96aETDlLIaOCl2qPIdXx0JhNkyZPRB
         MIXOtriGi/ZyMsd5NvrzCcqhFhVyWF+CrtjrlheAGwdPBrJMKqd20KnyjG6nfSwoMgu6
         brUci+tTCWDWkRjida3+MrTnfEzeUBfJUb+ioDuO9TK571tzc2EHRC9qhTw48jYfVcim
         DbrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyA/Q+k/4DBdGLmGUueRtG9qWQHGuzZtcMkoS6Ff031P3+nUMwwVPrFcLM+WYSDkULXgMCBFvCmCSuztoVytK4hIJKZQLmjn52K9vRfqI=
X-Gm-Message-State: AOJu0YyPouRzmmzDhGu00AKXBV5EQiEHZRRBT4FBcNYHEnX2tqOSv+NM
	vwu0SAKZOpbrzuwY0IxfZfH8HG33VyILWHQ//LIA2jhzC3TF+f4QB+4YF384XD4PBoZ/NFyUCAK
	+FEW6yD9nyiwapjhOY2c9zUbaM9fuRHyL6aw0IRY9l/o5A1khW8WolVINJkL2Kpvj
X-Received: by 2002:a5d:4f82:0:b0:362:bb3e:93da with SMTP id ffacd0b85a97d-3631998eebbmr1914388f8f.62.1718803272701;
        Wed, 19 Jun 2024 06:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIlW73KAkOwDRcPRuvHSGy4wqiMt0mgnebBuyTv5FiPDVqkiGOQ5fggLB28PPn9sbHyJarng==
X-Received: by 2002:a5d:4f82:0:b0:362:bb3e:93da with SMTP id ffacd0b85a97d-3631998eebbmr1914374f8f.62.1718803272471;
        Wed, 19 Jun 2024 06:21:12 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c79bsm17475715f8f.41.2024.06.19.06.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:21:12 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: mcgrof@kernel.org,
	russ.weight@linux.dev,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 3/3] MAINTAINERS: add Danilo as FIRMWARE LOADER maintainer
Date: Wed, 19 Jun 2024 15:20:14 +0200
Message-ID: <20240619132029.59296-3-dakr@redhat.com>
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

Add myself as firmware loader maintainer, as suggested by Luis in [1].

CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Russ Weight <russ.weight@linux.dev>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/rust-for-linux/ZnHkQpyiX4UKdLEt@bombadil.infradead.org/ [1]
Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38e7e0edd9b8..19e4a21e574e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8569,6 +8569,7 @@ F:	include/linux/arm_ffa.h
 FIRMWARE LOADER (request_firmware)
 M:	Luis Chamberlain <mcgrof@kernel.org>
 M:	Russ Weight <russ.weight@linux.dev>
+M:	Danilo Krummrich <dakr@redhat.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/firmware_class/
-- 
2.45.1


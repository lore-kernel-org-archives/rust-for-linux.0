Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D18E13D600
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 18:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721760865; cv=none; b=sQBY4oJ684NeP9E2n+LjcGf8HWjWNQAbBhP4e+F576OhydQG8qlBn7zZtXEZ/NEo7CD6Vy3vy9UD1P9UTW0t17jXFx41lpGktizw4MJYqR1Uk68G2ZbYgdt5rI88mSFb+dLfz66as0VXxxII0VVHJZwLVxjMgmEQOljLPwEBNJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721760865; c=relaxed/simple;
	bh=hBGmJFGudBcu7tftLyopZNa5ZHDvY0w16iin1mnABWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsumIh7kv6BN76s4NDKws8FJFGznNv3bEMFvcfwFI/phPGUrnI6Hn2D5AZUnLO4izRbOj/8U/6o4Itl+Yj8SCY8zAhDqcKqX5Seg/yeadOc/OhM/bWZwfUdmu9ufJR2ZFRV0KzUNlyQFe3wSSp4ptaWoGZLVILGhUn2EHRSXOf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=euWl0Vrr; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="euWl0Vrr"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a77b60cafecso115169066b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 11:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721760862; x=1722365662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o1PzO6HxZpKiR7Rz2aR5/ziuFXny/LO3qCWA5hi2tjQ=;
        b=euWl0VrrWVyH9nailACpreqfyg2EtN9kGJoux2sRqQriqJPbocUGLwo9M2Bet3BBfJ
         6D/8gZ+RwXgma2vmHFtsvwUIcCp7+1CpN9fLpsO4po8pMRY8dAnqqeJlgOtM+TxYV6Xw
         cULO3UqO+RzhnkpIgVRhnFu3yI9NRKk7xfHH6qHEb130+WqGWWNXqKShqZ2S8NNAj0TD
         fA3xau+hLjytAT6eY8X6GB1aeToIs8YpBJrSiJohnv2MqZYIQJOgto7sH37Ql12xnvwf
         sWbscSVB+8CpD33UfhLNxb0GZJs1WZhL90M9fpjAQCIQYhUjr7zcUeXLkJ2AakUvP1XZ
         6zaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721760862; x=1722365662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1PzO6HxZpKiR7Rz2aR5/ziuFXny/LO3qCWA5hi2tjQ=;
        b=WXQB8dt8XzwWRwU9tLqOckfGjxs1rjd2g0HPjJBkLQESQSbhmcAiBkqRw2/G+3GNzk
         V65hM1/aAsykgc2XB6FkTHM4dUeNuxT19Zt0XtlqZvNJqJbIPVjNpJvUyzqwIY109L8a
         QMLnxf3iFyvpY/fQFlbDMPOYZTBYEAsv+yjB/xSRUAFXb4Gfx2pW4mZko9NiWx0Keqgx
         fil9ibXL/U2vKMsvnyvOzfEAVnvFXQRwcT5K8j/26dbqnXoOQFoQExI+rmKNEVvAawip
         SD9KMxNHFIVX9sKnd7MFWD67umRMFVxbbZKDRy2zYp0Uz+GgtmFvHaW4rJ+FnMpDiupn
         gEhA==
X-Forwarded-Encrypted: i=1; AJvYcCVWll9AkfB7yCfOU3vcxzpDk6RiF1n2syml3GrHupMOdT7voL5XJInq6N+ohPsZIWMFKI4nw+4wj1Ae6OiFgkeiEK7sSBlKioDx8x019vE=
X-Gm-Message-State: AOJu0YxyNLMriVC9UL3t1izuCj/a0lldZnUHYwqxjX2PbtbYA+OOmM8u
	jM1hH0+hPKK+SD7SM2vchR+3X+smZQKNMcimodBXDLVXZ4Ca97Z6KYe9EGJEqSY=
X-Google-Smtp-Source: AGHT+IFFlsbMiKpNZ6xTNTBTADEM6hScRq6FGfi8gHejzlkOcm3NDKRROYEkjF7TpTio3aaJeIWo1w==
X-Received: by 2002:a17:907:d24:b0:a77:dbe2:31ff with SMTP id a640c23a62f3a-a7aabca8c83mr33269866b.66.1721760861984;
        Tue, 23 Jul 2024 11:54:21 -0700 (PDT)
Received: from localhost (109-81-94-157.rct.o2.cz. [109.81.94.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a953dec17sm104856066b.44.2024.07.23.11.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 11:54:21 -0700 (PDT)
Date: Tue, 23 Jul 2024 20:54:21 +0200
From: Michal Hocko <mhocko@suse.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: cl@linux.com, penberg@kernel.org, rientjes@google.com,
	iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz,
	roman.gushchin@linux.dev, 42.hyeyoo@gmail.com, urezki@gmail.com,
	hch@infradead.org, kees@kernel.org, ojeda@kernel.org,
	wedsonaf@gmail.com, mpe@ellerman.id.au, chandan.babu@oracle.com,
	christian.koenig@amd.com, maz@kernel.org, oliver.upton@linux.dev,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Align kvrealloc() with krealloc()
Message-ID: <Zp_8XVdxHLtf203L@tiehlicka>
References: <20240722163111.4766-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722163111.4766-1-dakr@kernel.org>

To both patches:
Acked-by: Michal Hocko <mhocko@suse.com>

Sorry, I was a bit dense today.

-- 
Michal Hocko
SUSE Labs

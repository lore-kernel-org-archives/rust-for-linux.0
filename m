Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312231;
	b=H7AfBDZfgczYG2c09g230NdTg3WmdbWShq9HC1dmeMctQs9FZcicjpHMGELml9l3vuLB
	 yyYxtK4OMCvmsT913ki9eyD5zDuxjYwYY551RAECro416YvJn/CzUw2q2tGY9yeCCqrNH
	 PYEXqLZXxWX288qG3PwVETJ1tjUeQVX1W8+GCJeWKdcZVCxsUxOcJ/04A6ijpyXhKh3dy
	 1xgBnGKkkHZKpk+mdFLUEplcBaKn3TKRcpFKERXUZBvt4N6t0ebKOKrXxy4EnVB5k/Euo
	 iRohCsEtcwfGqzw9XZUfzhAuLRoGQmR0sj9npHpm4fyFusZM803Kds1ODc7NYvGkBDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312231;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=L2M4EXk08YUv56ylnMGx7FsGu77v6rwhJJTJynAxVPI=;
	b=Rt1a1xaxth5oRH/8IsMPimOOa9maoLFXUnXZRHHeWfNv25UeOuRaJIXbqM62KoXb/2mp
	 XF+SHeK7t358/4qiMuCV8di/HDMeUMSDpXHlpmBVNKcwKeTJ1qO2fWLaPITlhxKJ/Rxkc
	 UVQP0R+lK+1jEI4Q4t6tnL9JdQVbQotIJPbO5JgF3HE6Av/rJT0QUlDjrwiIo45Xat93Q
	 3fwJT0M7L0fjf45TTc31+ywGiazLYhZcywkA7aTpdR1nUpQBUPF2SoVRURMUomCH0LSmI
	 6CWkx0RJSQLGsRkYPVtt/Wy1+7p+8vTpLwZpVEf3xmLcQ3rnyQjbhPSkYgLzcstfjFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhq7JGJZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD09606A331;
	Tue, 10 Nov 2026 12:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhq7JGJZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9492D1F008A3;
	Tue, 10 Nov 2026 12:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312231;
	bh=L2M4EXk08YUv56ylnMGx7FsGu77v6rwhJJTJynAxVPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dhq7JGJZXHoS9o+c1poKZEOjkBCjeuLZ7zX0hWccAVH9FM/vbRYmoGxUbJc0+Ffr0
	 hmQgfHpG3UpvN/hh2P97fLWG662h+/x0JYn7dfCMMne8jz1B6S0CJe1DJm2SEtJh3A
	 0NYzpZ7h/c+8fKelWNpvFEuprtJX+udzRRnAI9c79CnbWM6SbpLrsMe1qlMK1BmqRA
	 q55c91k2o8T94srkDOFb5sWfABmWlZg+/N7zyGIianev7d+Abz2RvZlMVj0xgXwXu/
	 BE4CbgGhYb/8Y1WpdQ8rdU6TqHCNY0Iz10PTfem2DOuPVPpCgP7CxDdsyzd+XpFVqa
	 fBhcRPq7UqNXw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 10 Nov 2026 12:03:08 +0000
Subject: [PATCH 2/4] MAINTAINERS: Remove myself from MM misc, reclaim
 reviewership
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-drop-reviewerships-v1-2-07c2f06e8dfa@kernel.org>
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
In-Reply-To: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
To: David Hildenbrand <david@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Uladzislau Rezki <urezki@gmail.com>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=ljs@kernel.org;
 h=from:subject:message-id; bh=roYoGbyVnDWW90pYgEiUQSVn7qwiybj3V0PXh4TisIM=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI+c3Cri32+NDurrEV3baKCf3ejhl9bKKfnN8e+Pcp6T
 f/VDe90lLIwiHExyIopsjz/Ir4/SCRsXucFfzeYOaxMIEMYuDgFYCLbjBn+Gf7TqtqXrMz5Uu9M
 yHI7eybTlMnyX6xnhVyP6qrdt8Z4GcP/Sv/Ioknl8rPCkr/cW33YUnnRxYY5T8NyFvez1N068/c
 1OwA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Given the current throughput in the kernel resulting from AI-generated
series, I unfortunately lack the bandwidth to generally be able to offer
review except in those areas I maintain.

Therefore, remove myself as a reviewer.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2f7fed0d850..bb4f973b195f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17675,7 +17675,6 @@ F:	mm/migrate_device.c
 MEMORY MANAGEMENT - MISC
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@kernel.org>
-R:	Lorenzo Stoakes <ljs@kernel.org>
 R:	Liam R. Howlett <liam@infradead.org>
 R:	Vlastimil Babka <vbabka@kernel.org>
 R:	Mike Rapoport <rppt@kernel.org>
@@ -17811,7 +17810,6 @@ R:	David Hildenbrand <david@kernel.org>
 R:	Michal Hocko <mhocko@kernel.org>
 R:	Qi Zheng <qi.zheng@linux.dev>
 R:	Shakeel Butt <shakeel.butt@linux.dev>
-R:	Lorenzo Stoakes <ljs@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	include/trace/events/vmscan.h

-- 
2.56.0


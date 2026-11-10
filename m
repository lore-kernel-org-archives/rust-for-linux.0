Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312222;
	b=nj0PRKINJ+sv20F5P8CZNieYRur6FZcLgi5kwLyEi/Zzs4Z5doqOTjj43of8xMsjsgdD
	 5mWtE2JABPkDqTE+xAknTOSqYq7VKJ1VwfbBcs4H1ywG2RrYO4O3vUO38xMm5zZkSf7er
	 Zphur9cJqCstzrXysgoImgxfW+o1Bl1bW2i9B9f/jzpamrjrI11YzBQsJ33YzldM2E+Ex
	 v7D3M+QAUN1/5GIfv6LpiVXRDq+ZOWJyGvnXWxuhCB7xKJIHVep2L7/iQeoMXy+5kHyLf
	 HXWxGQkAO51uLv1l2tibHLVeT7RfqjhXRZ/JoQt1J2+RA//xAuRu0XSteNviybyDN4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312222;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JqBx0yzByauj+DMV1nyno17Po8meeyCDbZXiNPgYBhk=;
	b=a+LUlmGGYaTv8vL1nU2QOzdS/BicW1saZKpGOSGxUPrbq6+vulqEK1B0EpYG8mG5YxWU
	 EZFckMc8rKAGfTI/ffC1EUD+KIAQ0AG/E3IKO7UP7Ajq7xuVbkX7YGM2OxFBumlSz5qAH
	 SrFtKN15o/gezXMqnmBgSWuxuy6lS5cFMxQ64qH5pcbcgrK1wussTMoedIS0XTC7xmQUO
	 LemmNq7RxmCUmu516mJQG+0og4xdrH6vHFragtpUfDyAeKAZZz+3LwKncxSQjk08qUfsE
	 xu0arYLisMFwCMlj/p0eWH/UvSv73+1w98jxp1BrmDMQ3Xd8NQMfTsjcniNsw1Lkltw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JCZx8O4M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA68606A321;
	Tue, 10 Nov 2026 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JCZx8O4M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4671F008A2;
	Tue, 10 Nov 2026 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312222;
	bh=JqBx0yzByauj+DMV1nyno17Po8meeyCDbZXiNPgYBhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JCZx8O4M4hGc/8Bn7L3F9RADLN5n41NYkCJfUUO/4rhPpwAJzQTHSmU6bnD9GZ/hI
	 2evHiCX3cUjXiwsXUB/m0GiauxaQSWbJ2ssp+bCCKTirVgKSpJ746kJTEYAEeptLyY
	 l9xD32bY7sy2enVtJOdq1kZGceBgSELpIL/Riod2QdyPaHMkWbO5LCDmU24qInzg3Q
	 EFAdtlF8XgRZjlVeSDcUx1cLNaeX2Dytc9cbqQUzsYW2+hB6y9HDoSqni46UGC/uev
	 dgfxWC7crqTjYAk6lz9ccOfur9hTEkuhg2LQqZU9AXYAOGpVIRN3Ur+uqVKRUs5YD0
	 FNDctkE4t7Cxg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 10 Nov 2026 12:03:07 +0000
Subject: [PATCH 1/4] MAINTAINERS: Remove myself from MM core reviewership
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
Message-Id: <20261110-drop-reviewerships-v1-1-07c2f06e8dfa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=752; i=ljs@kernel.org;
 h=from:subject:message-id; bh=OH5BliIH94nkWp/ohQ8/EQpKL0UvlMGgtBbAdMYML5E=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI+c3AnCZdKP99y2aHkfh9Dotz+NPGfjbFWIleZWxQYZ
 +3Zv/ZmRykLgxgXg6yYIsvzL+L7g0TC5nVe8HeDmcPKBDKEgYtTACbyqZiRYQ+n27HlXRsr/ie6
 ZuXU7BL/mxJy3Nxk54HyCI3nx5unBjP8Ztmcyveh4XPSETWB3WqL3jzKr38Txr9uRrf87pe3mno
 dWAA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Given the current throughput in the kernel resulting from AI-generated
series, I unfortunately lack the bandwidth to generally be able to offer
review except in those areas I maintain.

Therefore, remove myself as a reviewer.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..c2f7fed0d850 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17505,7 +17505,6 @@ F:	mm/balloon.c
 
 MEMORY MANAGEMENT - CORE
 M:	David Hildenbrand <david@kernel.org>
-R:	Lorenzo Stoakes <ljs@kernel.org>
 R:	Liam R. Howlett <liam@infradead.org>
 R:	Vlastimil Babka <vbabka@kernel.org>
 R:	Mike Rapoport <rppt@kernel.org>

-- 
2.56.0


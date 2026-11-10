Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312240;
	b=pHQkQLFfMUUAOnwSpM2OY9bl/0tzR2wP7fHhKRWD3N7t+6OALt2G0Ip54+vOmtWXTyCi
	 QeiaycywoWCfm6bwB8loG4wTvjp41frHrw3ZAVhNWP6rHsX4clg1Q2VuNKrIyMHs/11dA
	 LmfuJ4TyCOCHLA+b8oFHXBG1tcvhsWoSOesv9xXjbMTS7QiZ0Nxb8XpVxwvuSLGdy1Zi3
	 GwpekjlQ7DwjcGvEl/3VKE5nqcRZuJ/HgFV2PTGCJSHTNOw7JOzLXaGnwRWr9O6fDhact
	 rjf3LpI7Z7fEd0083bg7yOAjiBO4a8ef8EEWKtQj3GS557q3ATJyh/Gi7FVUeh48Axg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312240;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zsf6gGfdxiLjXd17MrZhzZWiPYtcEveS8tZd3C8SJcA=;
	b=2DnVm6ihAUn4KKxD9gFD07JLNFsrXByGpKhtOWFvIvr8SdHx31XBvyjEBrUeZX/NOY/8
	 VkpQldr+TD365CiZnHUgohpFULYvRXkOheo4iPsOFMCcdctxO3rf2235OMcnilC4/C8Uf
	 jSyWXiNfyhk08B7vz+1MEJG1iRzdOKRZ1WtUvZoObv04ss69oidTybgdBSsyjMCdhgErv
	 UUkfHbPhZaRI/3az+htO+kIA2EKAn2M/NJLIf8gICUelXCxhQbtuVKQcmQ6RvzNhaO14F
	 4F+ad2KJj+5IJknOpyyBQHRGc51MBaaq5RONbu4vA5/4wa2+PLT2sy3Yz99L03pTukQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UazZJbNr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCEB60A3811;
	Tue, 10 Nov 2026 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UazZJbNr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797F51F0089F;
	Tue, 10 Nov 2026 12:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312239;
	bh=zsf6gGfdxiLjXd17MrZhzZWiPYtcEveS8tZd3C8SJcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UazZJbNrY1JnrRiMYG+J0CIP3aLqOo+qTwuIM/q4+cinWIPihQs0HVHhnZppz+9Zq
	 2HmOkA2WZ8/4p1a0izUyBmorR0W3FdKa9tcCYEy21LSjDnI9aC4z+ZP6pTkqaX0DZP
	 O76bOwgjQQUPXQFqr9yFdcCcM3//NNJRR5+zL0GTxfwreoJyLdgaYirFCtfmU6BcfG
	 o3BwtOCHGh1Lw9FiGx+6l8NsAi1UzbnjMaHJSfepOnR1TgGwzWuKe7PnILEVVU+luz
	 WYbqNPN8joKKJiK8chAgQIrqHpcpXextzsf1hsNDrX5z77U3+TSrzImPIX6pyx3sMe
	 AayZgScOpn3jQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 10 Nov 2026 12:03:09 +0000
Subject: [PATCH 3/4] MAINTAINERS: Remove myself from MM rust reviewerships
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
Message-Id: <20261110-drop-reviewerships-v1-3-07c2f06e8dfa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=ljs@kernel.org;
 h=from:subject:message-id; bh=F5gq5QS7pGTPR4Dfl1UG5qSMcHZqfSOEnv60atDlEJI=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI+c/A0VdyY/TdQNrjigvJsTm3f7F/fSwLXPSxs3rpeo
 tVtw7ULHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZiIQzDDX/EtxwqlzXXjErXM
 b7/oNhQqEBRffP500OMWr5B5x6Ysj2RkmLgwXlD5tNPZ1TtrbaoffH59fEmA5yOX2e7LtvkIPXM
 0ZQQA
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
index bb4f973b195f..83fc5cee8680 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17958,7 +17958,6 @@ F:	tools/testing/selftests/mm/uffd-*.[ch]
 
 MEMORY MANAGEMENT - RUST
 M:	Alice Ryhl <aliceryhl@google.com>
-R:	Lorenzo Stoakes <ljs@kernel.org>
 R:	Liam R. Howlett <liam@infradead.org>
 L:	linux-mm@kvack.org
 L:	rust-for-linux@vger.kernel.org
@@ -24655,7 +24654,6 @@ K:	\b(?i:rust)\b
 RUST [ALLOC]
 M:	Danilo Krummrich <dakr@kernel.org>
 M:	Alice Ryhl <aliceryhl@google.com>
-R:	Lorenzo Stoakes <ljs@kernel.org>
 R:	Vlastimil Babka <vbabka@kernel.org>
 R:	Liam R. Howlett <liam@infradead.org>
 R:	Uladzislau Rezki <urezki@gmail.com>

-- 
2.56.0


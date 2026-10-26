Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793058815;
	b=Z11nSaMqIi4muAVisbkQcudqWJ1vEkkKTMgZkWyAW5epeaVnjH4DS/7u6qLE95Gs45aH
	 O6Bc38ylBzrbH1xa25YlnoFgiNoaNszKX46750W4ASZGrEKA4dNGDTK9n2gHf5shZ6OKf
	 gGpRB/J6JqLurDEHCEqPcPFx27kz6xZC2Leol9GsN2DF4XFpCNOrp86WltwayUaHdHi2r
	 aB8YiVJs8yl3kXihdUNUyfLlTgwwbdHJ+KLKXMkzUDEiK6oEoLMF4WS69x5GVJyn9u29y
	 Y/g8LifcYU/9YXFuzLrkI7Xtg7pNAPwo/Y58JJ9u5M+G1phyi/fU3a2EneW4+oj/v9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793058815;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mailer:X-Mutt-Fcc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=aHUF1M+fidDDJ3+WmYV9zM0U4gJMDdswMRaltUWboIo=;
	b=sk68sQR8rLikvSsaR2QWceAw71g0pGYgtKYNGqU/XNdj0Qs2UUyEAXD4PT4pB5GvNpLD
	 7fxkxcQraLelrBBeRJSillO3CSYIqyMoWWmbuKdPHqYy7v52RzD20grNh4W6nWK/nBAJr
	 C+R83T3MW8Ew+WcZ4VC8AcgrTUyxyJUGGf4DTjKJiCsMxbyyBVrq4GtC2y9lFVkKNvAvN
	 wH9/6NJvZBf2iy9vN6f6Bg2xAxaelAqkvbx42Ckl36uZgNKLQvlJB3tjnUmkEty+7Dx0y
	 lsOrlD5cNArpK3leFeyDogLq//GWHAD+5ZNKowAaBRQjDCRlDEz9337W80A0wyX78Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ce+9A87Z;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0271F606A31D
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 23:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0271F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ce+9A87Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793058814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aHUF1M+fidDDJ3+WmYV9zM0U4gJMDdswMRaltUWboIo=;
	b=Ce+9A87ZQec/LAkZ5NPrEhW1s2uSS8PMaK/pIH8wsF8HaRcQY1gfx0gZnc6hGWbZTfWZz+
	+1sHDVajYpaM430o3I2qnEtF90Meji/Nl39t/KQW1o9Gxc+U1M4X7B5CnwbRy5DYFQNfeD
	SJIYuPttO3ncalWJaFy+C5wNU3QtZCY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-xW5vtJRwPn2o596k7nqqPg-1; Mon, 26 Oct 2026 19:53:32 -0400
X-MC-Unique: xW5vtJRwPn2o596k7nqqPg-1
X-Mimecast-MFC-AGG-ID: xW5vtJRwPn2o596k7nqqPg_1793058812
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so26408815e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 16:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793058811; x=1793663611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHUF1M+fidDDJ3+WmYV9zM0U4gJMDdswMRaltUWboIo=;
        b=qHqkQXUfwjKxqXlXvONUMospdN7UgrfNz8PzHNzyWHoa027dnNL8wcoUp/jj49HDkr
         N/u4L2j5aV1pzStrmZeSGGxwv6QtKkhr8ZXPV8rnUGENuj0iP7F4hwuAYfmIN+m2kwfU
         hUa65UydEMtqMyHRm5yWWjviv5nrWYj6ggmL10lD7p1RDRay28veE3tgNYxn4Ka8qbmf
         dTYYWfu7F8aIORnj3RvsXFylZ8ffA1h5/mV++VbPxqqAvskfENQFbJSXfQc/HP9DMOBR
         Gktomj4ay6uhX9EM1ahL8uI9cMauBXAuX/zpWXf7cmC2WCDuWD2rmurpo1ez3kzjcvmN
         SWEg==
X-Forwarded-Encrypted: i=1; AKwUvBz5ZHUyYH/OVREhS45hPPD/YOeaTUkGfCfIJTMYxDO6/EOPKj1iAK6233McwPbRMcYpuxRjULKR2rDHdwqKTA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKr7CkbSmCabYeJCg9M5HsZ1dNU26R7BW1Y/CcGxDqCDZo1aYXR
	6x0ER5c6MadI7t2IACFexydPe5AU5ArV73flb7vjjG1gJD+pKiALXUiSfUUbJEZ9oSypIdkXuo6
	xXzqkLGItQbrEcf5rW30YMJZWXto/yXX3eeKA2KS4AEYAkAhYqfobzXgo7lBCVBsQujpG
X-Gm-Gg: AYBFou2WQxjCoXCF1VbglqB/PyjQpvQPHOdXh4P/peSNBvX/C5Lu78QXkwLWT4+0hVr
	U/WuQivAt/tAa4ne5KXNHW5aQTc4suZApxNHPxBXAiEnjMYzH1vIj6X4ZoR5PZ6xNj1H6fgP9/u
	simj3LWhPTIqNMxBLSBct9CWlVNNdxPwR1jdHdd8eI6hNwBk67SPhl/YzWoffDLjF5hQ6mYHHKv
	IfOeNEyF12K9QOpK4p1QqJGK+jMFXQyO7gdLdtroLbDUheyB/Vi3mgQ36dBDz8GW5eh5ssGXV58
	Y/KGxFzZ7TRFI40UeFpteQHhpHGaT4NxmPHxmG/KhO0QXoMCkG7ezlwCoT6ZThfQrq8=
X-Received: by 2002:a05:600c:3114:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4a35acc772dmr152484285e9.19.1793058811476;
        Mon, 26 Oct 2026 16:53:31 -0700 (PDT)
X-Received: by 2002:a05:600c:3114:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4a35acc772dmr152484055e9.19.1793058811049;
        Mon, 26 Oct 2026 16:53:31 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm280919645e9.13.2026.10.26.16.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:53:29 -0700 (PDT)
Date: Mon, 26 Oct 2026 19:53:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, Ruben Hakobyan <hruben@meta.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/2] virtio_balloon: submit reported pages as individual
 buffers
Message-ID: <02257263433b001cd0a55a52486857df81dd4246.1793057483.git.mst@redhat.com>
References: <32e21059adb6cb1fd08c3f4426a313c77cf450ec.1793057483.git.mst@redhat.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <32e21059adb6cb1fd08c3f4426a313c77cf450ec.1793057483.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1wa40CoODFcqRtnItNFTF54RjOX9DRxOWtn-GD4j89M_1793058812
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The virtio_balloon driver reports a scatter-gather list of free pages
to the VMM so it may discard unused pages.

For an arm64 kernel with 64 KiB pages, the default reporting and
allocation orders allow entries ranging from 2 MiB to 512 MiB. If the
report contains a sufficient number of large entries, we will end up
with a descriptor chain that represents over 4 GiB of memory. This
violates virtio spec, which says:
	Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;

Specifically, submitting $2^{32}$ or more breaks Rust-VMM.

Submit each reported page as a separate virtqueue buffer instead of one
buffer with an sg list of all pages.  This also avoids indirect
descriptor allocation (kmalloc in the reporting path).

To avoid multiple buffers causing interrupt storms, keep callbacks
disabled while we wait for an event.

TODO: as an alternative, keep using virtqueue_enable_cb_delayed
but add buffers after there's space in the ring.

Note: if the virtqueue is broken, wait_event on
virtqueue_get_buf hangs.  This is a pre-existing issue:
the old single-buffer code had the same hang.

Reported-by: Ruben Hakobyan <hruben@meta.com>
Cc: Ruben Hakobyan <hruben@meta.com>
Fixes: b0c504f15471 ("virtio-balloon: add support for providing free page reports to host")
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Notes (changelog):
    changes since v1:
        keep callbacks disabled while draining: get_buf re-arms the used
        event for the next buffer, reintroducing an interrupt per page.
        Disable the reporting vq callbacks at probe, and only arm the
        delayed callback to wait.

 drivers/virtio/virtio_balloon.c | 59 +++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index f6c2dff33f8a..b88b463488e0 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -202,25 +202,53 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
 	struct virtio_balloon *vb =
 		container_of(pr_dev_info, struct virtio_balloon, pr_dev_info);
 	struct virtqueue *vq = vb->reporting_vq;
-	unsigned int unused, err;
+	unsigned int i, err = 0;
 
 	/* We should always be able to add these buffers to an empty queue. */
-	err = virtqueue_add_inbuf(vq, sg, nents, vb, GFP_NOWAIT);
+	for (i = 0; i < nents; i++) {
+		struct scatterlist one;
 
-	/*
-	 * In the extremely unlikely case that something has occurred and we
-	 * are able to trigger an error we will simply display a warning
-	 * and exit without actually processing the pages.
-	 */
-	if (WARN_ON_ONCE(err))
-		return err;
+		sg_init_table(&one, 1);
+		sg_set_page(&one, sg_page(&sg[i]), sg[i].length,
+			    sg[i].offset);
+		err = virtqueue_add_inbuf(vq, &one, 1, &sg[i], GFP_NOWAIT);
 
-	virtqueue_kick(vq);
+		/*
+		 * In the extremely unlikely case that something has occurred
+		 * and we are able to trigger an error we will simply display
+		 * a warning and exit without actually processing the pages.
+		 */
+		if (WARN_ON_ONCE(err)) {
+			nents = i;
+			break;
+		}
+	}
 
-	/* When host has read buffer, this completes via balloon_ack */
-	wait_event(vb->acked, virtqueue_get_buf(vq, &unused));
+	if (nents) {
+		unsigned int unused;
 
-	return 0;
+		virtqueue_kick(vq);
+
+		/* When host has read buffer, this completes via balloon_ack. */
+		i = 0;
+		wait_event(vb->acked, ({
+			for (;;) {
+				virtqueue_disable_cb(vq);
+				while (virtqueue_get_buf(vq, &unused))
+					i++;
+
+				/* Stop waiting if device used all that we added. */
+				if (i >= nents)
+					break;
+
+				if (virtqueue_enable_cb_delayed_max(vq))
+					break;
+			}
+			i >= nents;
+		}));
+	}
+
+	return err;
 }
 
 static void set_page_pfns(struct virtio_balloon *vb,
@@ -635,8 +663,11 @@ static int init_vqs(struct virtio_balloon *vb)
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
 		vb->free_page_vq = vqs[VIRTIO_BALLOON_VQ_FREE_PAGE];
 
-	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING))
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING)) {
 		vb->reporting_vq = vqs[VIRTIO_BALLOON_VQ_REPORTING];
+		/* We re-enable callbacks after add, when we want them. */
+		virtqueue_disable_cb(vb->reporting_vq);
+	}
 
 	return 0;
 }
-- 
MST


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097303;
	b=EsEG3Roo088qTwjV8muZy5v5yfwFq78/Ssgy7qZy+TtogVH88YorOtKx4CAfh2ozTg3+
	 dVRtmMUB2+5t6vDe1R89hRAY6hJ6l5Yimkt/wFgTcUIgIEgne0+HkINS/wVlQVh3DK6QL
	 G+ifWrXm/saIAZEB84PqDUApd8zl9tI6eeZ7XIgnzUftuzEwbrn7sLpwz610bWLs1uljc
	 it3EFKCSyrWnPRwKslnKp277sUEbVEm4q5D9U/IGW7/36kWk6f+pAimWrQuk1gYPRtQrn
	 6+3ZqDV4Ci/fMnImmKVCz359vC7LbjqG1oXtH9o+yoYJZyzKlXavy+wHCfQBQubn2pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097303;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=wP5SnFym7LuxSO8fJHfvurJtMfYN7gDtkIUiKX0oP0c=;
	b=nzJgZY/qVPbZixvBjWFOmJHgBOSq/HN9r50O8sKcAD43R+RgVtcFUIOtS+wUvCEBlpGC
	 Qe3QHoURQ0rskDo2QiGJMA6JR/wntxTw2sClmJzb4eqNVp7RAqnoYLNSeCRCeZj1XtHWS
	 sdWaktP2Cv6diXetbMSUOzPodoEPGGD+fEku/9lZyfjd554RjQm1zcOQwDod3LeXo77gm
	 gbSdALqelyF0M98ObmbNd4HNQBlfBkkSIVTRGOQvkuWbETteBJ3jEJZPT6Otc/5I2ttMA
	 YeE8rPO3XzKBdRi26YpTHmj6azDIwhN6CmUClY1IthrReJgmn/EA9NyFQ5BkgWF0kxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=En9NQR+7;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98DE606A31A
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 10:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A98DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=En9NQR+7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793097301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wP5SnFym7LuxSO8fJHfvurJtMfYN7gDtkIUiKX0oP0c=;
	b=En9NQR+7w9i55NpRxzVDOyoGoREtqZcmfrt3uPddMsmZGT32nP4Q6U3wpdldRnVoTvLYdK
	OkoPl4wYPkMd0aQnqkdybP+KcS0EP9uVeAWUtmuO/5XXWW3zqeMEDXyQO6q+dWQP4mbbVr
	1JzviK7hr99OHneJhU+ANi5yBooljlI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-3sb-MtUwMJSg88WC4DU66Q-1; Tue, 27 Oct 2026 06:35:00 -0400
X-MC-Unique: 3sb-MtUwMJSg88WC4DU66Q-1
X-Mimecast-MFC-AGG-ID: 3sb-MtUwMJSg88WC4DU66Q_1793097299
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e011829easo3110268f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 03:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097299; x=1793702099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wP5SnFym7LuxSO8fJHfvurJtMfYN7gDtkIUiKX0oP0c=;
        b=jwiUsWlnwhvvnXeJTUnfBxhqbKmuem5hsvOgQr51VuPNvGDEViWqO4GA7oXJHzQVol
         T+POyMUc8PQC8PViwe5xGQwGazIAcouI3ftHX+PXfzu1agKH68bpzbEqyxUIctYgLiAa
         hO83bEv+YnS3YQYpDW6vHmtoeD121JOoKwciE2REAPpQIRht+5ve0BfXrKAuT41ALSTu
         XEjfyiVhFGyg7282SewYQ062R3TEmsUUFiROpU4YPWobyV8dKmeem/mVTZlLUZZ81Btr
         Jcmdnnbu6+j23dwgynwQjGjGBwz6tDnOeIaw2QhOXObtyLx/aqbMSmnNcb554nvf/30F
         9Llw==
X-Forwarded-Encrypted: i=1; AKwUvBxN+ubu3ETvIDI0NORsBEOm3x5avFGM1fmDccS4hlwE/6BDSlBwLM48UV5CJajdjkCXmF940tLu2uzoItJmnQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKucwKFUWYcytM2wzAhV65w+0/9PTp9AV1JNegIuZkHnDgqjuP3
	yP+LvLWIcebQ6xzk858f2IHOaSuhMupzunPmcTAWfiBx3ZFN7mh/Y2W3khkiFt1AIMjGbx4Y3uU
	1aowJYiumPKGvbEFF0+TeSqAIDh8MsFb0l/6jvKH6NZ77XGh1XVVCigka3m/X9Yah9uQ0
X-Gm-Gg: AYBFou0xSxMmR4nfFvP3z1J98iwFJBcRDP8VSqgeAELTdZnc7YlD0AWmeGaKi6at5lh
	qVEY0vh6Lf5oyN7xu+VD6e6zdKrj15SwELmEa3mIJCGq1JzLtUuzvzlTLO5lEp5OuRv5W8SVbN4
	ZNDpBQu7mvK34Xj/5JC1o/M2VClXWMBewgI2fUXtSZJccqaXTLwWctRl54XnJyscmYMUAvB4CNs
	euot070odZKb2z1UnqkV3RGhtaGS+dbybXMpaoXX5fSkMpCsHx1Z+MIxYimnfbMP3j7P2kujIN6
	CBbGCbOoNhukmrIs6YOyiW/dT87cH459Yizw5n44LmDzaZUgssFowZRnHn3OGjRkKg0=
X-Received: by 2002:a05:600c:3acb:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a35aca4fe1mr175945115e9.16.1793097298529;
        Tue, 27 Oct 2026 03:34:58 -0700 (PDT)
X-Received: by 2002:a05:600c:3acb:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a35aca4fe1mr175944285e9.16.1793097297968;
        Tue, 27 Oct 2026 03:34:57 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08643dsm204197985e9.4.2026.10.27.03.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:34:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 06:34:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ruben Hakobyan <hruben@meta.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] virtio_balloon: submit reported pages as
 individual buffers
Message-ID: <20261027063247-mutt-send-email-mst@kernel.org>
References: <02257263433b001cd0a55a52486857df81dd4246.1793057483.git.mst@redhat.com>
 <20261027092633.3831267-1-hruben@meta.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261027092633.3831267-1-hruben@meta.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -IqtGRk9yB6mm6isbJMPL7E4A7ynEUQl3qZ_3F5JDIo_1793097299
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2026 at 02:26:33AM -0700, Ruben Hakobyan wrote:
> On Mon, Oct 26, 2026 at 11:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > The virtio_balloon driver reports a scatter-gather list of free pages
> > to the VMM so it may discard unused pages.
> >
> > For an arm64 kernel with 64 KiB pages, the default reporting and
> > allocation orders allow entries ranging from 2 MiB to 512 MiB. If the
> > report contains a sufficient number of large entries, we will end up
> > with a descriptor chain that represents over 4 GiB of memory. This
> > violates virtio spec, which says:
> >         Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;
> >
> > Specifically, submitting $2^{32}$ or more breaks Rust-VMM.
> >
> > Submit each reported page as a separate virtqueue buffer instead of one
> > buffer with an sg list of all pages.  This also avoids indirect
> > descriptor allocation (kmalloc in the reporting path).
> >
> > To avoid multiple buffers causing interrupt storms, keep callbacks
> > disabled while we wait for an event.
> >
> > TODO: as an alternative, keep using virtqueue_enable_cb_delayed
> > but add buffers after there's space in the ring.
> >
> > Note: if the virtqueue is broken, wait_event on
> > virtqueue_get_buf hangs.  This is a pre-existing issue:
> > the old single-buffer code had the same hang.
> >
> > Reported-by: Ruben Hakobyan <hruben@meta.com>
> > Cc: Ruben Hakobyan <hruben@meta.com>
> > Fixes: b0c504f15471 ("virtio-balloon: add support for providing free page reports to host")
> > Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >
> > Notes (changelog):
> >     changes since v1:
> >         keep callbacks disabled while draining: get_buf re-arms the used
> >         event for the next buffer, reintroducing an interrupt per page.
> >         Disable the reporting vq callbacks at probe, and only arm the
> >         delayed callback to wait.
> >
> 
> Thanks for the patches! I think sashiko-bot found some issues on broken
> queues in the first patch that are worth looking into for correctness.

Surprise removal of the balloon? Nope, it's a pre-existing issue that
it's broken.  Besides it's not really practical, no one removes
the balloon - no need.

> Other than that, I tested the "normal path" on QEMU and Cloud Hypervisor,
> both on 4 KiB and 64 KiB guests, and this works correctly.

Thanks a lot! Can you pls confirm whether the performance is about the
same/better/worse?

-- 
MST


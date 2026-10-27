Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104812;
	b=KXRh7cA+rFGFL4DPufHTJeL2bpAAnW4Sns4nu1nLvv0BvPRmPsD6NSFKfO6SY5vyz200
	 fsjhMuci/ykuexEUCv2VvQ4OwjpQ5Ubv+y+FWwz+fgPJRMFhCQxo0RPEkSnzIEdVHtJ+h
	 oNw7tt+n6qBLnVmU9t9jusjcwc4TemR5IDIUl7FhBYFoxOHOLgeOq9nq8clnVQ6M1yUXK
	 rIcR6uSlb10CKqeI/vRH/YC8MnSDEILzpsrqf37xtAKIHQAmo4sk6WUrrqIwF13IGVTfW
	 1i/IP5nJZV6EXVOv+DAmUwzrXpxcdB3nAbPSO5YA9iS/SEoKnECyAqQlAflY4BneMFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104812;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=Mi9hiqxsLrpMoS8pdP+ccDuuJgKT+wlBtqA3CohVCQw=;
	b=K3HiOJXaGxyHJWrZhNibKXnQiNn2eInX7VLUjM2R4k8B67pkoheyuP3cRbmRYNECdqQ4
	 nCgWPEKpyIzLoCvjL/E5hORQuc4nywG/r7d3sgNcZvm7BtzOWsoxU2Y1wDLKD2aN3Zx23
	 NqbdvqH7mOZrjUnyqpmpKh3Eok23MDQscRDzcgOJdm2t18RpB3Ym9y7qPFLjtY+z5/K5r
	 7TzfzE/RKvMyUo7xWPggMf+jNcA1pujRwul77Lzx5uBRTusFZ6/4a7L21/tWba5LDxGJA
	 csEChdGZjwTz9Qqs7mUrJD5pFj2li0ZclY3t1LG2qogK/fhLLgTGvQHQVJOcDgSED5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gqv9uQcW;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126B606A329
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 12:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F126B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gqv9uQcW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793104811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mi9hiqxsLrpMoS8pdP+ccDuuJgKT+wlBtqA3CohVCQw=;
	b=gqv9uQcWdFX9F1murQhEBzjTMRF7evzKNHMMuD3KpYGvqKpMcX3517sn6rsUufedxUV1VU
	ZVynJ2ATjm8iPbZQUIWFZHIxbeGaneus5YW7VeST6NhihsIQGkE6UlCqlR1zcPoWhoTrt+
	pfDbAANbDjGtV67e9DyoLk8HtE4hJAA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-hhdwuMHQMMi5YpNNNBqNWg-1; Tue, 27 Oct 2026 08:40:07 -0400
X-MC-Unique: hhdwuMHQMMi5YpNNNBqNWg-1
X-Mimecast-MFC-AGG-ID: hhdwuMHQMMi5YpNNNBqNWg_1793104806
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b0a199b20so3649746f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 05:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104806; x=1793709606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mi9hiqxsLrpMoS8pdP+ccDuuJgKT+wlBtqA3CohVCQw=;
        b=jA/H+8OlDFWZVwcv7VmG0Lr6xi2+rz0ETPaSgbopBM1qjEvQyOgZokfnuoMN5c1RB2
         Mi22WpROQlXpWxmto9zgkqx++EkVApr8UxybbsywpUWcutyDYTjEG9VFV68+b0tf43kb
         rRvVbfxc+3zjYAyVtJys/f/q3cBzbEldZ89lSl+kNAx9Cjwil5OD8pmLXRxqSxO81nDQ
         n191aBnWQPPUVQNmkckW/N2njKoe7IfSB2oBPULEpdwKxvMQVtpHpHxI+PKfeaW/SmxV
         AUiR61bRCs5A0GdXwE8s/KgJtKf1vzMy8KQyYvPWwsomilrZ77vB0k6qzzyEF2xxi2Pb
         VL9w==
X-Forwarded-Encrypted: i=1; AKwUvBz7sUkyDn97Pzv4QNfpqJBvHK7zpKDJuxFOAU3cZ5SrMdrQeW2rF38FYT3fEbo8Trnk/syhOpEqv5sTT+DnDg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIUBaov5RTEk/Ueqtp+G6t3kMVnfM6Xzmcc/dP1LOVPvbzToJM8
	a8XVEfmdTRNAZUG9OCs+yqYahUWmnbajl03KBc+NeY8yPEBb8sqfgEPmuP9Fcx9JpQYLm+Z8XeS
	3irLsqfJTTjeetRruX/fMIMYn2hNgqQRnmbIm4yuHHsTBXMPw8Mx34rO8v87EoVSjke8U
X-Gm-Gg: AYBFou1XVOriuL6gcXbyn1aZvCHsXBy36tixY7mJYs+GNhAaWrPkPMP7WjPk2J3gV5H
	NEevPaQxA1LpSOJHfWem4CRL33cJeX1tInvFx1+92aVhHWrQ+tcoH+k2GrMZeG8nC5sQPaKBJx/
	Wq2/DgFKUocWHXUfhuENQhdpOGruGxqytGKYvdo9bFT1BA2LfeHZt+vxqecJRty5cDfYEs/BW94
	WCyJgRGzGYJQZn836d0hKhEjYcW6XJMoHsblFlaXdo/YosWqBBsqvZ29oklJeupKsilUVHz7kWs
	jsYORk6UkyvTpPsXA+P25LT4RLA1AN3SVBAM5Pha2qgVX2enOgnsrnAotTXuVxWF9uc=
X-Received: by 2002:a05:6000:2884:b0:48d:ec3c:3247 with SMTP id ffacd0b85a97d-48e3ebb18bamr16997755f8f.44.1793104806150;
        Tue, 27 Oct 2026 05:40:06 -0700 (PDT)
X-Received: by 2002:a05:6000:2884:b0:48d:ec3c:3247 with SMTP id ffacd0b85a97d-48e3ebb18bamr16997676f8f.44.1793104805593;
        Tue, 27 Oct 2026 05:40:05 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm22687863f8f.17.2026.10.27.05.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:40:04 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:40:01 -0400
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
Message-ID: <20261027083627-mutt-send-email-mst@kernel.org>
References: <20261027063247-mutt-send-email-mst@kernel.org>
 <20261027123204.2671561-1-hruben@meta.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261027123204.2671561-1-hruben@meta.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UHayMIhCTT4XG2_0Nyep1sWa1GSQZkguHmjeLgmyDMc_1793104806
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2026 at 05:32:04AM -0700, Ruben Hakobyan wrote:
> On Tue, Oct 27, 2026 at 10:35 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Tue, Oct 27, 2026 at 02:26:33AM -0700, Ruben Hakobyan wrote:
> > > On Mon, Oct 26, 2026 at 11:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > The virtio_balloon driver reports a scatter-gather list of free pages
> > > > to the VMM so it may discard unused pages.
> > > >
> > > > For an arm64 kernel with 64 KiB pages, the default reporting and
> > > > allocation orders allow entries ranging from 2 MiB to 512 MiB. If the
> > > > report contains a sufficient number of large entries, we will end up
> > > > with a descriptor chain that represents over 4 GiB of memory. This
> > > > violates virtio spec, which says:
> > > >         Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;
> > > >
> > > > Specifically, submitting $2^{32}$ or more breaks Rust-VMM.
> > > >
> > > > Submit each reported page as a separate virtqueue buffer instead of one
> > > > buffer with an sg list of all pages.  This also avoids indirect
> > > > descriptor allocation (kmalloc in the reporting path).
> > > >
> > > > To avoid multiple buffers causing interrupt storms, keep callbacks
> > > > disabled while we wait for an event.
> > > >
> > > > TODO: as an alternative, keep using virtqueue_enable_cb_delayed
> > > > but add buffers after there's space in the ring.
> > > >
> > > > Note: if the virtqueue is broken, wait_event on
> > > > virtqueue_get_buf hangs.  This is a pre-existing issue:
> > > > the old single-buffer code had the same hang.
> > > >
> > > > Reported-by: Ruben Hakobyan <hruben@meta.com>
> > > > Cc: Ruben Hakobyan <hruben@meta.com>
> > > > Fixes: b0c504f15471 ("virtio-balloon: add support for providing free page reports to host")
> > > > Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >
> > > > Notes (changelog):
> > > >     changes since v1:
> > > >         keep callbacks disabled while draining: get_buf re-arms the used
> > > >         event for the next buffer, reintroducing an interrupt per page.
> > > >         Disable the reporting vq callbacks at probe, and only arm the
> > > >         delayed callback to wait.
> > > >
> > >
> > > Thanks for the patches! I think sashiko-bot found some issues on broken
> > > queues in the first patch that are worth looking into for correctness.
> >
> > Surprise removal of the balloon? Nope, it's a pre-existing issue that
> > it's broken.  Besides it's not really practical, no one removes
> > the balloon - no need.
> 
> Fair point about that. But I meant the broken queue check.
> In virtqueue_enable_cb_delayed() there is:
> ```
> /*
>  * When the device is broken there is no point in polling used->idx,
>  * the backend will never update it. Return true to let callers
>  * exit their cleanup loops instead of spinning forever.
>  */
> if (unlikely(vq->broken))
>     return true;
> ```
> 
> But virtqueue_enable_cb_delayed_max() doesn't have this. So I was just
> thinking the same reasoning should apply here?

It's broken there, too.  E.g. what is the "cleanup loop" in balloon?

> >
> > > Other than that, I tested the "normal path" on QEMU and Cloud Hypervisor,
> > > both on 4 KiB and 64 KiB guests, and this works correctly.
> >
> > Thanks a lot! Can you pls confirm whether the performance is about the
> > same/better/worse?
> 
> >From my tests on QEMU, CPU time was about the same as my original patch
> and unmodified Linux.
> 
> To bring a concrete example, with these patches it took ~437 ms of CPU to
> reclaim a whole 8 GiB with 4 KiB pages (vs ~434 ms on unmodified Linux).

OK so that's just noise, there's no difference.

> 
> With 64 KiB pages, it averaged 121 ms CPU (vs ~112 ms with my original
> patch).

Is this measurable, or also noise?

> 
> (I tested this on Nvidia Grace)


Thanks!

> >
> > --
> > MST
> >


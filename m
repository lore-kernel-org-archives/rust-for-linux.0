Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030446;
	b=neuOHwIxs9S/JmUwrulM95AfTLDiwnzfmg4YWMSXUsEhViNFy+nGHlyr1PHgf+bEol5x
	 9P4CoOTyoHC6xTygFTTr+nnzq7WCgJOlONE/5pl+QonF2XslANdjHksq7MgiKDYw5bFIB
	 qE9+WAz+bPxkka6h6Lt9PZTSig9IamWPt9XlNr56Ir7RI3YBxqr+XsUELfJ1EeAyNshkW
	 LC1uG9j1GuHa+DW/YicUOhFnoxEPKxFTjX1c+/GJmdMUiDltwF08E6GnUEibYFRni4nlW
	 i9ge4EYjjcU7nSjuatX4IQsStaLjziuwUcOAK1AQJbrk2nx0uAsVK4mXqT86sHFyGkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030446;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=gdGEMgfJnyh5c7TJH0CYOcTTMHllOethu7h0lyRTWF4=;
	b=YENIom0jQj36z/yuimvOGEWAW6OI3irU4bY3kRxM6GhnzjRIYpeUeOwnahHwCgGc3qGD
	 1gf4Pi73E1r0RYaOtVasnUO8jHdNtGXxnWOruxLxsZhbiWV3crLgA1f7iYoRoA0ON7tmI
	 xBkD6xB/SAJVTNha2f2BycVNtDGmFGmY5+sKl6/w+YJdpOySp5s9baAxdzJMAruBXT0Pe
	 3lUSlOoJSAg5C5f4vAoGKYuWGUaJ29/86tuZAPDgXaXKH2EOoG7BAeYCjbfh/52aoObMm
	 f4BTvY1CJNcbUJ12jXuowixwC/5eQpjvlk0SsGhQtAcrJhaX1tZnEwqpnG8Rp0NEUKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ibk3sMPt;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441D0606A31A
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 16:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 441D0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ibk3sMPt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793030445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gdGEMgfJnyh5c7TJH0CYOcTTMHllOethu7h0lyRTWF4=;
	b=ibk3sMPt8DljIW5kR0Yiq0+RsEK4aJLxodhN4zDfPkdKO34DSbrAnihBCZ490HNLgPqIaa
	HQ68gv6RcBPsa2Pc0TK7CfWe1GF/9BDy6IlNR3poNXu6F+6c7o9l+wtN3J5r6+BOeUoIER
	6ed/Suqep1rwWvSH7RxyBUqB0Va12Q0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279--2ebddn4NOydzHpFJQP3fQ-1; Mon, 26 Oct 2026 12:00:43 -0400
X-MC-Unique: -2ebddn4NOydzHpFJQP3fQ-1
X-Mimecast-MFC-AGG-ID: -2ebddn4NOydzHpFJQP3fQ_1793030443
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c415561aaso2087247f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 09:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030442; x=1793635242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdGEMgfJnyh5c7TJH0CYOcTTMHllOethu7h0lyRTWF4=;
        b=jJavQP/r77rJjrBe2+XQFElHodWqh9KpsryoCppQObhmX9OrETyid1zOz8YxN9wpTN
         vLfz3lZOzSwAVHaCYTPp/Sd9DtB0wkv+psxXQc2vFQX4a0EvupKPByNsCUMQH/RZHkGQ
         1F9lxbXA29QlRWmgJ8AihdZdtffO0QLK4k9FUxC91ZXyNiapnGta9sGBcABLlwhjx6tp
         W5vxvsgDeBjyue8cErCwJSmNvG8vxf/ol+xiUJHmu64MSCZfrNMVsiQQR2EzBihkQiFL
         itgB4AGReUfp3UCkELekFm6gR4LElpy/uAhDxPl8NgZeswFUPCglEF/po6ZJVwQsYaut
         31yg==
X-Forwarded-Encrypted: i=1; AKwUvByvvb1IG9Q507pxEPuEIiohgyu/oT6zzFokPck7nAGVWQKoSNJSGzEQ4Kj7afBnw0nkgNHFcd0TxssAdClDpQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNBVT3ja78IfQw1ESy4aIo2pe5BQT79DC+u6CZTqACXEIMlDZJ
	z3/sJ+MyxbZE5q0VGvbEITmJKNRvOKoEbh+3ir/kVkiWUQaZ+uNeezdy5nscd2sbHTR+Hy/D780
	vRduJcMHPB218ZQ1lZjxH1UjabIrdbxoQUjxOIP+NCAiDiE8t763nNP8XwQ3gtDHPcv+d
X-Gm-Gg: AYBFou3/7kXzlXHRH7Q1y2CRN5/klxZV0bexZ6rY9Nhp6RUkXKsaGmsKgubTOyod/a8
	oar+9FUJiMIB/LXbpGtCgrC+iGduTw0+jL0nkXcjsfNLnz0nXhFJyVvrqXK9HI4H1EjNXfAH8F7
	am/lBRvv23hMlZ36T1eRycNqjasXM2TVplRmMuNk3DBMoA6mmxDq0Anc4aOIKRXB9blILx6tENl
	mlWVrMnVCXG6LieGt9hp54DMIur43vFrt/UcEjz4UNYF/C3RhlQClbGuQJuArjOn0W59svStyDx
	fXuAG8oSAJQAC7cNojgoJgwqSyIGLatK1q1et9YFMQVPoj9F8Bs9r/9XXBGrMpZkMV8=
X-Received: by 2002:a05:6000:160d:b0:48e:35d4:55b5 with SMTP id ffacd0b85a97d-48e545bcbe7mr1461295f8f.52.1793030442384;
        Mon, 26 Oct 2026 09:00:42 -0700 (PDT)
X-Received: by 2002:a05:6000:160d:b0:48e:35d4:55b5 with SMTP id ffacd0b85a97d-48e545bcbe7mr1461218f8f.52.1793030441486;
        Mon, 26 Oct 2026 09:00:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm17511497f8f.21.2026.10.26.09.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:00:40 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:00:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, Ruben Hakobyan <hruben@meta.com>,
	David Hildenbrand <david@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] virtio_balloon: submit reported pages as individual
 buffers
Message-ID: <20261026120022-mutt-send-email-mst@kernel.org>
References: <ad6a530f49c4a0e182112a73789e31b5e91f3bb7.1793026707.git.mst@redhat.com>
 <6668d51dbda117d05d2eddd47db6ad69baab8b0c.1793026707.git.mst@redhat.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <6668d51dbda117d05d2eddd47db6ad69baab8b0c.1793026707.git.mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dSwh3mRDBiHY2GJFJirJxWm_1ZfFhSStIS1WCWRdvDw_1793030443
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2026 at 11:09:59AM -0400, Michael S. Tsirkin wrote:
> The virtio_balloon driver reports a scatter-gather list of free pages
> to the VMM so it may discard unused pages.
> 
> For an arm64 kernel with 64 KiB pages, the default reporting and
> allocation orders allow entries ranging from 2 MiB to 512 MiB. If the
> report contains a sufficient number of large entries, we will end up
> with a descriptor chain that represents over 4 GiB of memory. This
> violates virtio spec, which says:
> 	Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;
> 
> Specifically, submitting $2^{32}$ or more breaks Rust-VMM.
> 
> Submit each reported page as a separate virtqueue buffer instead of one
> buffer with an sg list of all pages.  This also avoids indirect
> descriptor allocation (kmalloc in the reporting path).
> 
> To avoid multiple buffers causing interrupt storms, keep callbacks
> disabled while we wait for an event.
> 
> Note: if the virtqueue is broken, wait_event on
> virtqueue_get_buf hangs.  This is a pre-existing issue:
> the old single-buffer code had the same hang.
> 
> Reported-by: Ruben Hakobyan <hruben@meta.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

brown paperbag post,forgot to commit.

> ---
> 
> Lightly tested. Ruben, could you pls help test?
> 
>  drivers/virtio/virtio_balloon.c | 48 ++++++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index f6c2dff33f8a..363519fa890d 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -202,25 +202,47 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
>  	struct virtio_balloon *vb =
>  		container_of(pr_dev_info, struct virtio_balloon, pr_dev_info);
>  	struct virtqueue *vq = vb->reporting_vq;
> -	unsigned int unused, err;
> +	unsigned int i, err = 0;
>  
>  	/* We should always be able to add these buffers to an empty queue. */
> -	err = virtqueue_add_inbuf(vq, sg, nents, vb, GFP_NOWAIT);
> +	for (i = 0; i < nents; i++) {
> +		struct scatterlist one;
>  
> -	/*
> -	 * In the extremely unlikely case that something has occurred and we
> -	 * are able to trigger an error we will simply display a warning
> -	 * and exit without actually processing the pages.
> -	 */
> -	if (WARN_ON_ONCE(err))
> -		return err;
> +		sg_init_table(&one, 1);
> +		sg_set_page(&one, sg_page(&sg[i]), sg[i].length,
> +			    sg[i].offset);
> +		err = virtqueue_add_inbuf(vq, &one, 1, &sg[i], GFP_NOWAIT);
>  
> -	virtqueue_kick(vq);
> +		/*
> +		 * In the extremely unlikely case that something has occurred
> +		 * and we are able to trigger an error we will simply display
> +		 * a warning and exit without actually processing the pages.
> +		 */
> +		if (WARN_ON_ONCE(err)) {
> +			nents = i;
> +			break;
> +		}
> +	}
>  
> -	/* When host has read buffer, this completes via balloon_ack */
> -	wait_event(vb->acked, virtqueue_get_buf(vq, &unused));
> +	if (nents) {
> +		virtqueue_kick(vq);
>  
> -	return 0;
> +		/* When host has read buffer, this completes via balloon_ack.
> +		 * We report pages as individual buffers, so arm the callback
> +		 * to only interrupt once all the queued buffers have been
> +		 * used: otherwise we would get one interrupt per page.
> +		 */
> +		for (i = 0; i < nents; i++) {
> +			unsigned int unused;
> +
> +			virtqueue_enable_cb_delayed_max(vq);
> +			wait_event(vb->acked,
> +				   virtqueue_get_buf(vq, &unused));
> +			virtqueue_disable_cb(vq);
> +		}
> +	}
> +
> +	return err;
>  }
>  
>  static void set_page_pfns(struct virtio_balloon *vb,
> -- 
> MST
> 


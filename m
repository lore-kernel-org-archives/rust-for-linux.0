Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7327E2C859
	for <rust-for-linux@vger.kernel.org>; Mon,  4 May 2026 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881299; cv=none; b=XNmpjRbTM74KBJjXWKfjJoon2SZAiIQAQ9BpYGlOMgZ9uOKFnKBGmYVOnn2TRB9csXjRloXxOUCyLsNNToyUMaIQPwJINoswRrqKZJw3Zvxf+J+5v9et8/g2MUG1q/UMbau9Fc15IQRTnuPPn1rHfknDs0QXRuTaaCaric5Y/D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881299; c=relaxed/simple;
	bh=9JE9zg6TGoXwE2Ye9BJbQ5ggqkvTbS31qTg7kLPdaxM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X2uvF8WYCmT/I3NWmMzU6PtPOzve0H4LXlWXlUOVo4UD3M/WpEVV24pX4KwVYLX4P06heeFI7fq/66VVWLQBGQURHtfsA1F7p9DYA7EdbFmx2LlGzzqnRWuJcy3gYCMs5SN+11HR0l+E/B6w613l5mqQdE5cWvXBQYXJzgehvkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OY6mQ1oh; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OY6mQ1oh"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43efc93e4f6so2813959f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 04 May 2026 00:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777881297; x=1778486097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPwW2VczbGiDj4gVa/ND/7hdW1Q5aDi/GW+YjzixtBw=;
        b=OY6mQ1ohLEfJNysQrxBbied1MXWk1dNbcgxkpXRDc0SFyN9/eHIi70DCN0E9VcZ7e0
         URlBcY6SmodoW32aVc8Pd6MMDXbp4Dlv7KQRIHCiSyodVbc276N2V0ChbSpoU5ne4Axz
         Mdo3BbOCIeSPBWzMqQ/FrTyaD3XGu1uimVN18Mbf/lsPDjdNlT1XtYwDWR/1RAcWYTLY
         c6hTrmfTuc6TKfL6C6Flh9hru0LKCLB3ynrHf75M47LhgZiacsPWxldg13/hxwDAUmLU
         sHeZWK4r2ofyeto+GI1F1Xj1xgBqK1w6TLVHruL+9KlyOS46z2k8egKleqJhcfr1zcyY
         KAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881297; x=1778486097;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TPwW2VczbGiDj4gVa/ND/7hdW1Q5aDi/GW+YjzixtBw=;
        b=GrsBoQj35gHK17PcOD/+5QGwqa73tng7LhZfYEY9Xf1Ome5hc12uZaOM/kWQK8BnYO
         u3hufVoYUAkmFNN2GdwSO15D6oEJUA1cO7Y8lljzk7FehAdY+1J1dj0uUFeMG9uh7RYJ
         8mSp+fIPEfGmGKSRd4mEi++cC9/wmC3AnL4cOsXwAVilH38wxrWeJcv+MIXGK8VSmEa9
         iqsocNZ+5a/KQvT2NegjiIdE3rwhGUHCES0cJMMNf/Trk1GJGSM0DggFkp+NiBqU7kUd
         QKu6+zExsxWmXO8T1ss4Nc8TLw0KVJSSQbDYBd+CwlwwUiRjEih3tk4SpzBhnmVv0PKd
         LJlA==
X-Gm-Message-State: AOJu0YxMXDKSBQ9VwFAXhYC6tPw4uaG2HZRg5pyQCQIhdrFR5YCD+M4j
	ugNGGz4QRjXmQGaOVpGzP9R4w2ROCul5SfT9MEGesLdUMaC/HlbiW9CljzCHYIXKwvkOg2L0Ctj
	+pmlFF7wTTvxsxfsVAg==
X-Received: from wrbdz9.prod.google.com ([2002:a05:6000:e89:b0:44a:4650:c0c9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1ac6:b0:439:bcc2:bf0a with SMTP id ffacd0b85a97d-44bb611032fmr13415501f8f.23.1777881296466;
 Mon, 04 May 2026 00:54:56 -0700 (PDT)
Date: Mon, 4 May 2026 07:54:54 +0000
In-Reply-To: <20260501191122.64311-2-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260501191122.64311-1-work@onurozkan.dev> <20260501191122.64311-2-work@onurozkan.dev>
Message-ID: <afhQzt2VGa-QQYSm@google.com>
Subject: Re: [PATCH v2 1/1] rust: add Work::disable_sync
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, tamird@kernel.org, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2026 at 10:11:22PM +0300, Onur =C3=96zkan wrote:
> Adds Work::disable_sync() as a safe wrapper for disable_work_sync().
>=20
> Drivers can use this during teardown to stop new queueing and wait for
> queued or running work to finish before dropping related resources.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/workqueue.rs | 121 ++++++++++++++++++++++++++-------------
>  1 file changed, 81 insertions(+), 40 deletions(-)
>=20
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 7e253b6f299c..d0f9b4ba7f27 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -267,7 +267,7 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::work=
queue_struct) -> &'a Queue
> =20
>      /// Enqueues a work item.
>      ///
> -    /// This may fail if the work item is already enqueued in a workqueu=
e.
> +    /// This may fail if the work item is already enqueued in a workqueu=
e or disabled.
>      ///
>      /// The work item will be submitted using `WORK_CPU_UNBOUND`.
>      pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput

Can you elaborate on the case where disable leads to failure here? Can
you not enqueue a work item again after disabling it? Is there a doc
test illustrating this case that I can run for myself to see the
behavior in action?

Alice

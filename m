Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D129342048
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 11:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771672821; cv=none; b=UCte2M0aTwPObmkqHKxLrdH2actMXcbZ8MDWjhhmS85wdfmTrWgV5GrI5IsZbK++i0DossgLleguulnPScHBImCr1CaV8eqTyKFfXGB4oqTA8I+A76/bBy+0fbrrKaAJa4v1bP8/8u8PPwzORCrFIWQOX+CxiGKY204jc6kGjRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771672821; c=relaxed/simple;
	bh=9DkYlLtq0LMCBQHB16UxIvlilklCpBTRoO69HaLbjYs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K8tIxlhgyLXWmQRlyGcGrUFmv98inqDjzcGnHSShaqWZTv3m250p5IMY/4qgNCdgHK+yZZLTnklwkb6dyMzT/n72kqfBWnF0CAAXfexzUG5Czk2e9Y/L2zsT5w9Um3/eKNh0fkAYuAfOhpddEiPn/JFCfYuvOG29rpLhwSO516E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3HFOmLU2; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3HFOmLU2"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4376c206493so3090862f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 03:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771672818; x=1772277618; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BHG+anh2NPJoM/5HPN4gxSqeakHjDTk4rshPOUldzpc=;
        b=3HFOmLU2k73SVXw7jjJ7PyjJ4OoAROSjG+QNbVOal3KluppIP6FUNhGDDf60xOSDLN
         GIObApkRFH7G8FwstAMrPk0XnPQQP1N/7Wj43qVtrqpAUsRHMhGI/9s0QHe3KohqcQUd
         BQah9iuPDkA38VeneYY5COF8j3tOCZCM69sGEMUzzF3m1rlsU11sVVO8Tl1HAY6+c9Ag
         CkRaRv7KjtsKT2dzLQL8SsIujBdaPpV5gyo8tjjdRqvAJUpg1ANLXLlfObIUkBAMLUvX
         4PXZRPOTQUWrYsQzVS7U0CbaWl+XjOR3IzuuJ8FXTF4ivQ/zeUxMCUk2MHVu+oZoMz10
         h9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771672818; x=1772277618;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHG+anh2NPJoM/5HPN4gxSqeakHjDTk4rshPOUldzpc=;
        b=V3Q4g0YpRE+Z624Z/mw9h3wnJgpXIAIcRDf9VRah50aLY687MnaQcFE4IFGpmyX99X
         vLfkw9LoWjPGFJl0m0NaEILubjP+NB2pVYQhvBRjq5vaEtZ4quCu/VvwSykstNau+O1K
         ZFMFis1yiw7W/6ildD8l6xtFcrUcWFQ7obhx97kNsLJUCBKtRX3ObPGn7BkFGXMyOWV0
         9/RHiqMGDQjZVxt/AmZL4PgWZdjHQ8VjsXtVleGUS5Y8gVONkp1PkSQyTicOauTRdsK9
         L2t1MK52sPCESH3iuAuhB8HJzmKh/QLxu34mMBhm/1dK8vpQL7GKS4TPSQV4MT77OXHh
         UZmw==
X-Forwarded-Encrypted: i=1; AJvYcCXR3FqHBjkaaqGtRyANHusjBveWOAYPJnNIHuMv/MpAq+8mioDBMBQIszaazB8bGpgeIogp3hA92I6HZNfh7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaJ+G3e5PJwNgBpk/sWDTDUrLeP6jRmV4eI0lSLWyFdxGlOtdC
	sdY4GbtZLOhsIB+9oybWakEtE7FRp8z81V620WBu37xjMwCg04imskWT4Vopkr9Lo3dYBPRWUZx
	4537/xZR7qCb+2eRwQg==
X-Received: from wmby20.prod.google.com ([2002:a05:600c:c054:b0:483:7890:570f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6986:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-483a962e00emr36391475e9.19.1771672818245;
 Sat, 21 Feb 2026 03:20:18 -0800 (PST)
Date: Sat, 21 Feb 2026 11:20:17 +0000
In-Reply-To: <20260212013713.304343-9-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com> <20260212013713.304343-9-deborah.brouwer@collabora.com>
Message-ID: <aZmU8QUpu_gL9JDr@google.com>
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	beata.michalska@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 11, 2026 at 05:37:09PM -0800, Deborah Brouwer wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Add a Memory Management Unit (MMU) driver for Tyr. The MMU wraps a
> SlotManager for allocating hardware address space slots. The underlying
> AddressSpaceManager performs MMU operations including enabling/disabling
> address spaces, flushing page tables, and locking regions for page table
> updates.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

> +/// Any resource/information that will be used by the AddressSpaceManager
> +/// to make a VM active is present in VmAsData.
> +///
> +/// On activation, we will pass an Arc<VmAsData> that will be stored in
> +/// the slot to make sure the page table and the underlying resources
> +/// (pages) used by the AS slot won't go away while the MMU points to
> +/// those.
> +pub(crate) struct VmAsData {
> +    /// Tracks this VM's binding to a hardware address space slot.
> +    as_seat: LockedBy<Seat, AsSlotManager>,
> +    /// Hardware configuration for this address space.
> +    as_config: AddressSpaceConfig,
> +    /// Page table (managed by devres).
> +    pub(crate) page_table: Pin<KBox<Devres<IoPageTable<ARM64LPAES1>>>>,

I don't think the Box is needed if you #[pin] this field.

Alice

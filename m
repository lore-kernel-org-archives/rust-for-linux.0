Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531203CD8B0
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 17:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774287780; cv=pass; b=N770cg2XUV9MKxd5fWTf/TAoMFzWru9UVnCVIueC2C5gIJ9gX57ec91I4SgzuDTJg3OKD5m4dEDahgySuOJ867hwXZ01R1dhp7VkUgpiqVmGWBQSe+3zSitG1WoXTiVe1ecFTR1Y4EeWBP0FnpPXN7MDWJW47HGvT79DgEc6bQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774287780; c=relaxed/simple;
	bh=CunB0afxvU/gEx3rEbTE4vI3pmEepGsuyogimCbubLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4e0o2GnM5rv9sStY89yeIo5CSQct3HvKZ/3R6jRKWkbu6Pm8eT4MmRa+LthqBwSos0DseKwNT85amt6ey/KqfS278bAVakX26wWx9HqfsdZv5hsojQs0LFdI/Y+cEM1h3xmDO2ouQnGfJ071uCEbGqpEF9Qzw03EeRWO8M265o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDw8eAfN; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDw8eAfN"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12a6b260693so279952c88.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 10:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774287778; cv=none;
        d=google.com; s=arc-20240605;
        b=MyVsjhywojd1GzZHpvK6o8qFOdAtoB6/b86gb+wNmc3QloONiYBc2IbhsUTTa3vry7
         uyHUuB45VIu/bpq+8cZXncbJj5UxP2q4HuwrZ5loHHIeh4mrpaEQ2goSe4NRFn35O8nG
         yGK0NlII8vUMNqOzvVYZhyhfCFDOnHeI51071mmK/7DaELWw51Sw0RPUrEwSolXotErK
         Cu/HqKua1Oq6Gwxwui2PI8XUKTzehKxBaeq6eAVyo8y5/ZM/KJfl83gqfIJ2qxjDkSt9
         njxEGtVBM/OWutUl6Vmc7TwPLVcbpG4RZw108l3g7gZm3sBMRCeZBtR1iYOUXRN21+iz
         ZAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CunB0afxvU/gEx3rEbTE4vI3pmEepGsuyogimCbubLY=;
        fh=fvv5Kasvoses9A2onz5yvSZ2myantSdVr0vGp10YoLM=;
        b=D07CgBi/GfFAyioHt5lhXjBSGvAjZsHJgqfACeaUMZsuHl+3WGldAHXdZ0RvAWcFS6
         1O3O4xxcW+rzCKNf6HmZ3pq5eGBRxWJCGP+ytboOLgqq+ifIv07O8nHg0aacFHo+0OXo
         9HfZpigons4WtAYJhmllgcCIogzlRoto+ejAcyhrG7gebGPqVXdkebn+GcYYuFj0c7wY
         xU9KMmUR5/cZFmCsck6S/RT49rSQlbJdpkq9AhhHj6yXRnTvHd/BlK+90INcudpZ1sQI
         hFYvBAuoPzhaTzMETjH0fzaEGdBUuVzR1gUga4f8A5FgG86y8G75hLpAgM4m0aWDcKQP
         wC2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774287778; x=1774892578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CunB0afxvU/gEx3rEbTE4vI3pmEepGsuyogimCbubLY=;
        b=pDw8eAfNFe0iWHnHDblLFIr6/q9oyRq7GZnbwRou4uj5pqLQNWcnPeH9lNgeTguCNR
         E1zRdH+Ik2R+BE9Qef/arCY7KX1KoDx3EnJPT3VMcU/1b96ymRFP9yemU5uNllT7AjY/
         J7nc6VzeZBMGF2R8iXbL5z9f5tj7PF181v8d2nGP+FVTh++T/DLT8bpc1KH/CLtS36iY
         /7i23DnAuuza3fAK9CyAPNxpzB5CvCiiHwI8eQr6VaQnPlZ+U7LFKXB1uxuB9Cr6SusA
         OUrR8oU0Md1VA578Y05UOYIYr0s2nHBzz1gXuIzdECWxVBboufGZ7wUKip6hki+7WIZJ
         aO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774287778; x=1774892578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CunB0afxvU/gEx3rEbTE4vI3pmEepGsuyogimCbubLY=;
        b=ZQpMGUWqJIZL9DEDcxcFlWFq3OaUULsxWGZ9pRYt1Nl4ujw+MrpVSgMHIUSsIaD3f0
         mKxO4aPYoPTfydrseiWNJI/PZZoyTa3jvCEnqjvuPvpUc0OZkvpqCvyRtLYT8B1325K9
         6GAvAEH6P5x5WeEvncJI+JgP35PEYVHyswE5pSLCkwm9/OnVmEydaasIqZmqj6jorwgE
         eybPFhmenFW46IMNW0ugKtw9Lfq1URrSky7BtC33gkwT9sOdru7GZhfa9CZAFpwnuM8t
         oa1FqgUYoymHHxge5/Fxa5RVCpxzPTRkUTFeVUacHTOOaT4xIL5e0qL7MWFeqBefLWzL
         5Hyg==
X-Forwarded-Encrypted: i=1; AJvYcCVz49AyBY584Wm22wei6h5BmohiroybeKmKEVyRIkW4efQAjB3/hVl47UWxt1pzKlQXvFzuuoFDCQO7P74sjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Aiyr8lrvNQBGqpK2Uf3IOr1SeeGlCrbzYG3hyAx281cSEXk/
	iXJFMTg0/XV5Chkr8rWDEPQqlcbCyVcM0QCGYq+A0niOrMtbmq/JczzBYTGatteRrw2hkYRUbyx
	1BI63p+7ore8JPQkGhRq46z2vYERDcA4=
X-Gm-Gg: ATEYQzzhemJVc9dDRycfZ1lpyNIEINUExnMK7PNEHOUJZM+DDqOALZIXdyIPGWS/TuT
	3kSZnyXPBegfkljzWdqoR3Jz0D+1c/TmCiSZySHL2tgrH86hgR7ZZD8/WL+hp/6sug1WITAi5t6
	4d/wX9OY12p8zKiJgFDC3gtRg6m/C6+lrtzJAXPbf/qDLYFG3G9KbXkKMuCotgPS2HzcBOQ1Wmc
	ch94nSB7tTL7Alru0EPaYUNQpNt0wEoCCAMXSZJafO3uw029+kN6yBuBY4B/8pEo5Kik40WABWQ
	AzB2QcUbwc/FLPDA3FSrmH2acP9cNk2Xeg7zG21n4zJ1VcGmF4SLeQeth1ORCABVP2pOxE7rbHp
	urtBmarS6uDzUC7ScvMUTxcU=
X-Received: by 2002:a05:7300:d709:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2c109563bbdmr2193158eec.1.1774287778207; Mon, 23 Mar 2026
 10:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316043255.226352-1-matthew.brost@intel.com>
 <20260316043255.226352-3-matthew.brost@intel.com> <7A8108C7-7CF0-4EA4-95ED-8003502DC35A@collabora.com>
 <abjqfXERS6Xk4FAQ@lstrano-desk.jf.intel.com> <CANiq72=Y2g_5=iEzU1L07pMPYD+wVapJXpp9rvYXEzCKEs59Zw@mail.gmail.com>
 <abkQTEcRujrFLsdn@lstrano-desk.jf.intel.com> <CANiq72=gHArzFS=SkiZyPpEfSL+0AcU3ifKRnwfEyet42662PA@mail.gmail.com>
 <acF41mM66Gh7m4vS@lstrano-desk.jf.intel.com>
In-Reply-To: <acF41mM66Gh7m4vS@lstrano-desk.jf.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 18:42:44 +0100
X-Gm-Features: AQROBzDKSGfCowA5deNWr-GZ-_NHP2AiqkVwZir4qy3OHPmJLmEcG1YCXbf5NSg
Message-ID: <CANiq72n6aAARCm0_k1gQqKDxOL-MSbP1=M-inbdMSJN8tPn20Q@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] drm/dep: Add DRM dependency queue layer
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Jeffrey Vander Stoep <jeffv@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Stone <daniels@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, shashanks@nvidia.com, jajones@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 6:31=E2=80=AFPM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> I appologize here I shouldn't type when I get annoyed. This the 2nd
> comment that pointing out difference between C and Rust which really
> wasn't direction I have hoping this thread would take.

No worries, it happens to everyone from time to time.

Thanks!

Cheers,
Miguel

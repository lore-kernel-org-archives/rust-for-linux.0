Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE1D2E7BB6
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 11:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524061; cv=pass; b=CANNF3EwZQgRrUn6CGV+fa4hECvvVXXFPpWzSdkkwdAWKHVuGDhpDaTWDvzVDT+OjLYvOyGPL0JOFQucFfSlGBIbepcBdr6xr/sexfTRj32Bp9SH4o/1ZqTVvEjOmN+azjCwBMvU1hurEJjzAj6/CPZRIai+0+lIMtqPcdbzE1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524061; c=relaxed/simple;
	bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5DOqLt5J69Ba02EHzEZfPA9Rb6zQrFbzd1gxJeTupyKfl+vtLKcL1kdVEkGqS2r+lXbNPMbl4CUtKHMG2FuVjHcoiL7CUUfVBMW91mlI9YuUd5cDI8MKEWLNZrVCOoxL80+77+6K3UURBzmfRHbcnJcFQNwtnRn4VrgipdGBPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnH3+ytX; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnH3+ytX"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304dd3bb7a6so320884eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 04:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781524059; cv=none;
        d=google.com; s=arc-20240605;
        b=gdHcXpr3+t9qBtmosImrTvU0Um7iTIoS5q/ceZ4Ux7Y4Rhn+K6WQsFNqL08E/G1V0x
         0Gu9YJ2WW+mOp3Zxzrt82y1tFRTnjgND3poCaJz7w8/H89F2r9BDkiS9rZjLNpGWJ8Md
         8HjN14h1dp7VixdnUmVMP7G1eLgtNiUGmCp/gpSJPNkSMgD/jtmWvFWpAt7u/orrEwxO
         B1Ob0sfSl9myeowquJIIGSfZUyYP5f1D8M52pgOolNs9ppGXt12SCpvZVlNnPhmIK+7d
         VXzsX9gTZZucXg9w0geLQ6957m1/4m2igrWhkD3tMARf5j0iWy5rv9a+/cDAo0GrTB/r
         b8qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
        fh=LYL5SA12AudDn1eQIMObBnHXg2jRGhAbnBgXe+DRY5g=;
        b=ZbH2MkP1Gi/tRShdhfmvfATwWUkDPHwIoU/V7fyGRUlfd+nMSR1YJYJLzMis+TySD/
         9tI4OgKe+vLdYXEDFxRl8izF8dk7/JqNvPuVZge991lW+l+eICjUggOzrPchZGuMNjDi
         swfQrDdGTeoumtjkn9Tr8vrwr17NcdCpDqvLJkcDahtRDqQINvQnqj/Xa1/JsuO4fKpx
         FY0817MTxC+fS2BLtuhjoMBLS8U13cvbR13LhL0TZK96atJNVl6CQOxn7bBoaYe2tq3q
         xFxAz9IKziRw4ckLj6DDgGp0ZfrMN4WhEzlZXE5cRdEuMC60SZTFUMyv3PFpt3IrIGqk
         RZuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524059; x=1782128859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
        b=WnH3+ytXSeSYqSrxvNpsIZ/MsgkcR1gIvW/BRLc5c49+DPgOFvymSxT0MRSc+JjFse
         Aq5FrsB+d8LWLvYmHyv7BsWdtppeQhZ5xTlXPQAWOGyDbcnzqr6Cb2aLMOx0If8D/IXL
         fDhcF+p3dMXOnF1K2eYPmmaJXgK+ncYIXaItUbNsjbByx41328MqfdivFBKi8P3bGHhX
         1wpBfvT/wv9mCVXiZncPEyP+XMmwRrY8GpHjUIFoZG/N/1Yn6V7Ccc8zTyVyBFRZ2+BL
         UOnS0k8Q4kiZ+ICwufWSisIFTTKVF1MmWUTbOVFd7KPyKiivthIjE/RKTTBiWG1lU9Tb
         Wt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524059; x=1782128859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
        b=Gv++xj7piok6D1PH12UyWxNG4V6dMjNOTsOsrHcqlMiFk4YsbPOJsm9RvLeBh2KOpY
         BVs4cdqOfq0ylhBUnC6yujV86cyVo2kVOehdcgPi9EhlFR3ydVN70R8TPzlb84iqe/vf
         xVpPaoI+r+G7e5QJEWPo5Ht5BEFW7CNEnOCu9TCyD9t/ESVjnPai4bluOdHaQMQSxaHx
         VD4VQIfECsjFbWAENXq50WeYizZkTAp+KhAtBrxxWuSbJGRPDzwGZgdNv9b38K/UpLJR
         2IUfdRcel0tywA64/1P3D1crtLqkVDJX2qRmzIeVXsXBR1i4FnAVr39LLf2nU5gQtAM/
         Wt5g==
X-Forwarded-Encrypted: i=1; AFNElJ+ShRbAtXq5gYuTln8hWPMHPUqEozddo7YfNYHLazsJijLpPF9mSljQS1rSmpG/M5vgTU3yEAEoAiHnOKBrTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4XyjF4Xt6ogAxBFq85u/m7gseYKQXQXBg+nmwbpql6zKSeTfL
	D6ce0eZLAPvV8UgJRk4hbrcGmYL2JZQTtac5WSGz7OGCes2uiVYgt1oJkKkALQ+hykjpAiAr436
	7wHNJ7jn4GLV69FT/D0LnJEFPX+TCa+w=
X-Gm-Gg: Acq92OEXSJG4O576Y/Zvk0D2jkpQlBRf275z6bBZnSKFSG9K9HobtqrLFBgIh6lWboT
	Zi+e4uAgTlCZ1S/RUGBKpKxIogxFo0PNbIAqRokQZ/pM49TMjVce7X9lhwufpUA3+tFLGsKBkSL
	d+MnVo3GwgZn7Ok7qsqYgDRzjaZCbg56+dbHd87o1TId6LMBZ54i+RrRAgv+atHILrsvtqWGafI
	eO0pfGZ+vLZhJ10L597nNC8C8KdFdhkGSm99n1lhU39SUT+YGGnuig6Nt6LQ94iJzyk+SfMfqNJ
	LDIRWO8f8izA/5vsTJNbkCswR5OKBum8o/Q/Vn33Zf1SkZGcC9JwZFPDrOyvnZw2gpMr2d4g/CT
	XgZtSsUIQnC922qq+uoFsCVs=
X-Received: by 2002:a05:7300:ca1:b0:2ce:db5e:354b with SMTP id
 5a478bee46e88-30820093556mr3538872eec.6.1781524058794; Mon, 15 Jun 2026
 04:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-io_projection-v4-0-1f7224b02dcb@garyguo.net>
 <20260611-io_projection-v4-1-1f7224b02dcb@garyguo.net> <DJ9BPBO51J9U.FQYCSB4SSC8Z@nvidia.com>
In-Reply-To: <DJ9BPBO51J9U.FQYCSB4SSC8Z@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Jun 2026 13:47:26 +0200
X-Gm-Features: AVVi8CegjUXU8O3nUA4IWQxEABTAWlEoMDkVbcmMfj4RlduFup8ycaEWEgohXlQ
Message-ID: <CANiq72n4LzuHdu+D0BT0iew29rck1OydryyTw5j8JKhtW0prNA@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] rust: io: add dynamically-sized `Region` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 6:03=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> s/should/must? I guess we are running into all sort of issues if we
> create regions which runtime size is smaller than the compile-time one,
> and this is an invariant of `Region` itself.
>
> Maybe this method should even be made `unsafe` for this reason? The
> caller will need to write a `SAFETY` comment before dereferencing the
> pointer, but IIUC this comment is bound to cover the pointer invariants,
> not necessarily those of `Region`. Making the method `unsafe` would
> force the user to cover them here.

Given e.g. `dangling()` is available as a safe function for any `T`,
this necessarily can be safe too.

In addition, in general, in Linux we have been trying to avoid
unnecessary `unsafe` tagging, i.e. we try to avoid using it for
"merely dangerous" operations.

Thus taking those two things into consideration, then this should be safe t=
oo.

However, I think you may be pointing at the safety vs. validity
invariant difference (terminology is still up in the air as of a
couple weeks ago, from a quick check) -- it is true that technically
dereferencing a pointer doesn't require library invariants to uphold
right away, but in most cases (especially so if it is not your own
type) one needs to be very careful when dereferencing pointers w.r.t.
the library invariants of the type too (because otherwise it is likely
you end up with an unsound module or just UB soon after).

Cheers,
Miguel

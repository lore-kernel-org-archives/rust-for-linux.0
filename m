Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C913F4118
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 05:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450760; cv=pass; b=oWY8H0vHTtnMX3g/BruQcTotwN1QfCbhrh1qBZuW4IHj/HpJgnJfbeGtsUkFyI7HWhtcd08LrEqipoZOFtvdtBKUQHpVRgU6GgYQ5HLeCDdya1DewyU2IxsFG8WsqkTvx31A73Mu1+ycIuKxaTAywzbTR+VNA7yQUbJvTD1BZy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450760; c=relaxed/simple;
	bh=oZgPhjZZTU7Cih19Ba+ylw61wgq4bdvOE9HAW8ogZSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BzNd1NJSwWlHZHfdCsskNDbUit3bWCVuu14067mLg0qtOS98VnqPlqwjiey3Fwv1A+EbKVtw0Rdwx9Ynf813a7b4MaqR/ruGRYL2AbshcJhRj2t3CaH90SUUf8O3DnLA6KHIjftF7h5J1LHcN4udaUD5jL7zrD1Nug9ipnCFM58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRHQyWib; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRHQyWib"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396672b2569so294692a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 22:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789450758; cv=none;
        d=google.com; s=arc-20260327;
        b=LJYemBdOxgvt0dkdSAzYwhah+a7uwGnCseceFg25l1neQDwF8MoiZMjqGMuXEQ0nfY
         3cDsF9SMiGqCufkBarLZXOhFg5sYbum4lK9Bua69N17I+Ed50zpu3UpSlMn0OTNQVMSG
         FmdtGKXs8W2iwNrhB4mjRbHKhwGrqDXEggsUwWUBFRqds2zV+gGHOdFInlgh+p0A7VtF
         2UvKgh6BhoG/vu6kbj2aIzEuCPLFAiHY9OYjnP34M5gbF6Hbuw/rmnJv4vu0NISjBAzM
         uzF28Sku4X4VZE1EwVVrdNL5XLDBqiYMy0p2VCul5PVIVD8uPltk7dsUE4Xve8AjkZfx
         eb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=poCNEIaA6VGdI5KVygK3LN32EN3HdWB0bLyXipA7M98=;
        fh=guERN6uH2jmw7ZtTJE3BO3DUzyPpySS1arDMqUat34w=;
        b=jjw2bcXZXlmoK6l8iY9TUOibhHOGTjvAU22VwTHFbpDc85uoysWdwpKX7yl8rA5RLc
         GdjSBxZGFB6PeOCEd9bbJwSo1O494tZlBhL0PE5Lk/FpRynUJQF4XqQK0NWQspmgwHZ1
         V1AYCO5UuHu4tS00s57SYCTQ7scAKDlc4HZdZ3TePTmmGJY9fjpqAjqmMhs3DZceEaGq
         j62slWIygFdCDCdo4uAiXdNaGhdWtl6l3MrNvWogXUQs4LXU/H1nxuOBlzWi6SW0eSLM
         O4236guBNmcl+Z6YCdaCPdSjxrMpwfReePBJQWMa20KFmgQgfn6l0BtjTMet+m3C05jH
         /vTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789450758; x=1790055558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=poCNEIaA6VGdI5KVygK3LN32EN3HdWB0bLyXipA7M98=;
        b=hRHQyWibMLxCSmj5dub9G0ebI+pr/CwMvVFjX89BzqYUAkDOjp77cIWZJaRBBrCfYb
         WsvhlW/2wPU010IXeUYCxjTOhb+96I9ohdGX1l5Sj/HPpGnEJ+xff0jlXsUbFocQgHWn
         R/Ry09lZecc6IZ5T9fmEQIReO4k9RkXRTiUwU+9acAM87AYNhUTflSbjjYdzXnHrmsZo
         J5Ltv/WGdiW3048YJtbLRb9UFiEG8ax3zBQJLIKirtVF2/EuoDxOZOd1RNa6F10AswSm
         qqUp8Gc3FBxbtD1gbx9R8N3mT0pruVzwrZXUFV9ZN+ctMcJVsaOV2PywAQZNCRUNWVmF
         C1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450758; x=1790055558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poCNEIaA6VGdI5KVygK3LN32EN3HdWB0bLyXipA7M98=;
        b=fYfFLB2YqvVHQkU7CvFNcjeKTYLv2/gdm98p78SjxfRmaLux5vjrVCRmwnczIfM0So
         Z7ro91xISK66WNkAW0vA94Gp3Iz7dAI2VzJ8MyYybnYL8DgKl/gVdUC7NxqKKheh3S+z
         Ye6mCNmW1wqZWMTCA7yqU903rYlLUMvqz7TW24wqIZ0/jA0omk4TmzbtjtXZn8DWqyvx
         yPRJWrfZtHLt18mpeZeN5mVF7jTgBM1BY23ESu7pBYaDFCghzPf4W/cFGt/DZqMTxTSY
         saEOymQCtEHzaD97RbXYPiMhTifcrxu/3GzqtfN0DS6QEfWbGp8duQfaKU9IE5OrZmj5
         3Kpg==
X-Forwarded-Encrypted: i=1; AKwUvBx1TO2sdXkueDel02EZX7iAkJKg4NM4MZbw7BLtTHWIIONwhBrvu7OLmDaVsBCo9lWNeKGEiePJdx4CsTidEg==@vger.kernel.org
X-Gm-Message-State: AFuF++kus9NrwyBbqBLM2pcUYxrO4+I0KlRnXnULu/Ccw1u5hlqsbDPv
	U87OOWRaSSlv/PleSxBGm6yMuIKQaIMOTjVSryUL+ClMCM4IwG7mBjWMoadCaX7O7E1gH+BtBs+
	MNULW7w2hQncUYU4Qgxe0HytxvLeTX5I=
X-Gm-Gg: AYBFou0MOP7+kEslk3AURQO73OKJ09lZK8prXxreL+LcqkNAPnbKWoaykBEVJEtVMar
	e5d2/SUNWI4POkNw55jTVu/o4tIOWTDhfYmMRUePh9BLvwBxxvFtilp6RQodODiwZfkuQ4YWVfj
	XMx+qU2qqYbFRswX3JxY3CiXYfErWDp8FK8PyNMNlHo/De6Ph/7s3P87Ti4Yq69ZQHEsMEyeUez
	O0b6W/ffTN7z/PfmTxFd9EqglGq/JMHjo6zonrjIQjk3pyVqiEQMudACPK5xObah1iI3LRAPmwX
	4UY7cMKqfnqPlSBNv/Dwx7RWOMDhEUlIsnS7Q4UgGF/VNjQBvOKTZyiquKPUNOEdHXTtPRboEkS
	CS8MEGR/hvUNpJa58q4SPA6eg0WO1ZWYwQH27y43XPn0QrU1ZMCn0jxQFR5KEnvY/SAs6/5g95U
	fXU2VhEEbLDLmZmDtqA0xfmuLDUXF9QVtKBrT785c738kCECzaLQ==
X-Received: by 2002:a17:90b:440c:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-39dec137c0emr7955486a91.3.1789450757965; Mon, 14 Sep 2026
 22:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789420324.git.pgovind2@uci.edu> <f515b62bb05e7b6bf0bb06c8fdb362486fea25a8.1789420324.git.pgovind2@uci.edu>
In-Reply-To: <f515b62bb05e7b6bf0bb06c8fdb362486fea25a8.1789420324.git.pgovind2@uci.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Sep 2026 07:39:05 +0200
X-Gm-Features: AcwNN1VLEVsnNcc7MgH6GABS_6vDgssPHdlXmRPoVWKppjYFE36L4oSTNOtsqVY
Message-ID: <CANiq72=jRupLtnQSnAewyZZC7q4-oeAVmA=SfBGN+z_nefsnvQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: block: Fix unsoundness in `Operations::queue_rq`
To: Priya Bala Govindasamy <pgovind2@uci.edu>
Cc: a.hindborg@kernel.org, boqun@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu, 
	dzueck@uci.edu, 
	"linux-block @ vger . kernel . org" <linux-block@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:47=E2=80=AFPM Priya Bala Govindasamy
<pgovind2@uci.edu> wrote:
>
> Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")

Should this have Cc: stable?

> Assisted-by: ChatGPT:gpt-5.6-sol

Nowadays, it is enough to say "Assisted-by: LLM" (the rules recently change=
d).

> Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>

The tags seem to be missing a space before `<`.

Cc'ing the linux-block list too (please see the `MAINTAINERS` file).

Finally, it is usually nice to provide a simple example when possible
of the safe code that triggers the issue.

> +    /// # Safety
> +    ///
> +    /// The implementor of this method must ensure that if Err is return=
ed:
> +    /// - The request has not already been completed.
> +    /// - No ARef derived from the request remains anywhere.
> +    /// - No reference was converted to raw or transferred to another th=
read.
> +    unsafe fn queue_rq(

The `# Safety` section is about the preconditions for callers, not for
implementers of the trait -- this should likely be on the trait.
Should this method be `unsafe fn` then? Did you build with `CLIPPY=3D1`?

Also, please add intra-doc links where possible, and please see
Sashiko's output too.

Thanks!

Cheers,
Miguel

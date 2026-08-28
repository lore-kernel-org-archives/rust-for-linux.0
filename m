Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DFD3C9438
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 06:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897939; cv=pass; b=E7BXD/4hp+dG9JqvCu6ZF/wrzl68VyWbgu6qhAB4LcZkgRSrXCkeGqLPLvchxW9bVdiOmryfJb0i7f0ehODZ1/1zwRq0c6MEUXjnaxIj8JOxDqh96KvAKqXnhVqZnOG+DNQjN3gNEfmNgKDlTNa/Yu73/GB9z6n/eXPmwbjC9GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897939; c=relaxed/simple;
	bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNq4B1rMUucOpR6Uvf18EOm6Ft2L4QMGqAzxLiSZ7URQiL4BB18NBoT38iyk+wFbRqABw6S1g8qIOwe0e4pcK/enm6gmdeb2uc4jRy8Dbvq8yUOHd2ySfgvW44ArWDfrmPUzzqcEQTyNBl0zrXga86Q5Kl4lgmtN1bT8+mfEdEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV34o4qN; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV34o4qN"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf49dc28ccso386905ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 23:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787897937; cv=none;
        d=google.com; s=arc-20260327;
        b=PdEQ4KLteBsX2pdmxKqJ2+TPbHUqNyPgPP/nE9QuhY4ON3cdddIkPLrL31bqW7uHdz
         mat9C40L1TT4NjDfjt7V1KpjYZ/uWTgFnoSgj0XpXW455srG8t1sGCCDFEvEaSPbWd1D
         NDEGJETTWUOL8sogZG5N/D7CgdDeNNE2RuLJtOpD0RRurfsJV3kQkaUuSuvzsdKzguiP
         SmcPl1vXsspExJyiuFrF9RU8kQohsA234z0Z3ZMAquYON47ypaaZOzOkr5WZ3Wc5m6Pm
         danCZSOxDqKMY6TnMb80Itp06fzx2pMXDEVisCwdfvkmmECS0rUtt+pudQr7brPd+qkz
         vCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
        fh=jCZF3KvFwKCALYg/JZ4JNc7IW3MnmigdIOoFLCspYmI=;
        b=Tr0AjglL+mjkM8UEMoUMFZLg98qzWP8hajNabiEzxEGTKhJTWKQ4meXdxPebh6uJiD
         q2MJ/xTsSbnjOiUXA7PeaXEEHcoNYu0tKamrFY1PXkV9adyuWoirMd/i9WkctD4DYGJd
         ejcr97EFSSxPFk3YjuuS+L9brGulmBTKXqfADFRRx7spCND2SmUe1OV2+T4ASV74RDhN
         QKMvuRCF5VhlnxB/421x4V/HSYi4T/lsvC5DFdht49EZ059K5tIyIGmedm90zTRDkfeM
         SICkUGFtmNRgoE94dECDtH3ZZovU0E+BAzKEEAY5+S3JsoZwqXrm55Y6gpnO0KamQx/n
         vzKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787897937; x=1788502737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
        b=YV34o4qN5DymahBMj0wLjFQ2FYrn7s4hPQD79yiVsYiNMbqCo5rQIyDiipMgJ06TFP
         nLGnhv2cpJumPyjcXIOSorNWV8KaUiRfSe+4GaQcaOPhGDEzhtPPJN92s31cw7FkpziT
         se4BGKaN/UHGiWT3wx1BErDcXNJ5T1+Kn11nzD6wpkiDaS840ULXLsGy0JCObyq/nGsG
         5L7jCBMUo5B19iY98ZCsv9ZOFNWXxdkgHqzd/u5x86F4Q6ZXBiIDQSbsjUOe/5P4wIW7
         CAwOg4kuo5KDZnRc6aHhD/VbEwWCXGv5bDcfS/CN4VH1zqni/D6YA550Q1lprH9BtyK5
         +9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897937; x=1788502737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
        b=Og2S3qk3O7nhVng8I7DjAJW5Su/EGM3R0q9kwA4rxLVXCE8mfYCboh0zOQc1UlgOSM
         Vi5Sp7rGnTxpTrX1ta+kkEgmO8ZPo8iBbw63XxdXSXONUjsqos90y5Hj5K5rBqtNtebM
         4GIIlaF4tRhP9UeVuYQHjAX/afto5lGWFxako5C5QS4io2scAGMMr0qT8qz0/PsOmB+f
         0OqJt8ReIvD43tBjgN28kBoFdKwmpCF29ParZo9EUJsrz4Ep4UsG4kTvsnd66h++P78C
         hF40ZWk2zswhQA7cR176+XBJ+3WCFzJlncdTeCYCgPPF0A1sec66sMHN+Ga14MwyDAsw
         IuQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmELGXfRuT7H0NabVHAh/tkpDlNVfss6OVwCS8mVi0Hq+mFlrk/kjDymkYoH8mM4iO0sJRWbZKgDZ26Fg3bA==@vger.kernel.org
X-Gm-Message-State: AFuF++lU+g7UNF6H2kR9zzVHGx2XesME9RCnNDHNtbgUmXVc3YuzFqXd
	DkfMbWgV/iv/OaObEvjForfvgRmG2y+wn4Pgapns2W9lFCqrbxrQNiosaJVRwVjYydPSUBnwhX1
	CNyD6UE4QCwNDZawmDF8UY44dNuALZSA=
X-Gm-Gg: AR+sD12AMF1bC8J68Hbl99XZq/zbWXDzIhmeIbVYearivBzq4avWLYohTphteNH080F
	JPkyDxtNChr8ottp0NrFq17QcnkjcGHvNXs9cldigvSCQyGujiCyqgpPfqMxeELFbPToMa7fvhk
	DtRw0fktlf9OQSaoCuGQ/TWE2+NnvM+kzbZlHZi4tOQVV0ken4PlEwsA3cYsyaWU5iZD/apehW1
	cWXDXuvNcwolHaklEMKYHzmTLEQRgYttMXC3MOYfQ55UI5Ek73ZbDLseEbjpUbwpzzY3xkGvqMf
	zWlFmaBJMMKKn6TZcwAynBN8gocZ9WrgFLebYtE7tEEzmhBFSPP7pbJodZmug6gr8RX+kN0sQ+m
	cOdB8SOiR6r3I+hJ3SwZ4CdH95SA5QccALNDCpPdJ1MKuuDu5NzyCnWGRIR20
X-Received: by 2002:a17:903:4405:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d74dc2ac34mr44339125ad.1.1787897937076; Thu, 27 Aug 2026
 23:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com> <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
In-Reply-To: <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 08:18:42 +0200
X-Gm-Features: AcwNN1ViDyJ9UsnVnyAiW233fz48dbS3nQFZxVUyoEdNjL9Bfhx8up1zdVsAHFA
Message-ID: <CANiq72k3D_zyfsJ7aXRvpdnRTznRkLJNccYmYEWJt5SeO0r3TA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] rust: samples: add missing newlines in rust_print_main
To: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:52=E2=80=AFAM Mehmet Koseoglu
<mehmet.mkoseoglu@gmail.com> wrote:
>
> Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc print=
ing")
> Fixes: 47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >=3D 1.84.=
0")

Thanks!

These Fixes tags point to different set of stable releases, but we
probably don't care about backporting this, so it is not a big deal
(otherwise; we would have needed to split the patch).

Cheers,
Miguel

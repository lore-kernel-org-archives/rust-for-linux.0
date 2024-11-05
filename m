Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4931C231D
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805838; cv=none; b=r4q296AQ2xwtTcIs0TPJF59gKgt+HHJKvLvKTjubNP03fsiNMdTpGTFhn8H2sKHyAHIvApEUEE+pesbP/NR2hNkWeYTVSJnbe6h/apPxrrUuEkwxZphRm3pd884fykLUDq1cB4IIxz9rGu7795E6vIVLyOzUsvEU89Fd0BxDvXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805838; c=relaxed/simple;
	bh=nIeRiUfUNgL3N1xYfoK1TGB5DHZ8BfwxwIdp8665Q4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6WtTvc5Xr5XOk7qUCmFqeZrXqDV1o29E1OisWTjck1sV9V61sIjOnmWWvCOg+EawOnukjhgk3daVEEYEcotdaKXi3yW/oB2v6rC9EM+zeUMPsxioE1j0/N/zMeSHXqSsdaQLccAjoW2RgAwqLej4zXBtCCUBSMTbw9pHZRFTPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwlBGOVt; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwlBGOVt"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7eb068dbf51so760088a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 03:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730805836; x=1731410636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIeRiUfUNgL3N1xYfoK1TGB5DHZ8BfwxwIdp8665Q4Y=;
        b=lwlBGOVtuLA2JGWaLt6rCEaAKX+3KntXvk1Y3+YhPvfHyudQU9HJgzT0SY6El5NMKk
         Z3h/Xyn2A/sNty4ZbAwfe/SnQTHSYBNeHjN6WcxvmFCwlACLVf7QHoAAVye7PTyY7n8/
         Nka8q725ahRufeorxDodIKDQuhwzylOOEuarsbZL24fwECmRnbiPAwUOzWcWZqc+u3P9
         ucY6qm6TdXVoLlE41TzRiNtmFnCRFe22Pyi/5xT18Dmv7XCAYcpgI/BmhGZfrcz+71VS
         lOAefgqLXepc5F6ezxdeV8kYsldJ3XZ6fF2wx/FRfqczWmiygQo78g5eFDrL9CWd397o
         z/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805836; x=1731410636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIeRiUfUNgL3N1xYfoK1TGB5DHZ8BfwxwIdp8665Q4Y=;
        b=eU8BCaQMtKMYiYQNLlYAp5NbSNGRSjkX4biJnoBmGWTVUOt/vL2xIoVpesg6BDfRuO
         Uo/fsF8gKSP611lyiteOriJsmR92hf4mYf29WXgISgkrX2z7Pacylv37OaYlG6xWI5zY
         AnHxBLln//tkS45n3uTJH8MgFeQ75/Z6z+3JBQ++3qTvJFswM0YRsXCihjxp6kF/rsC8
         NrVdfD3t/7O0XjU+L4kw2t3T5Wq7NT7OC52q6oTXwuZqowDqPwI3VqdL0d8yC0ecect6
         zq0Tur/ffKVzD1dlVNmmKVwcFLGHnM5LmtPX47XcKQU+ih3t4c6VczOHzjmoH3yi3PuL
         BPtQ==
X-Gm-Message-State: AOJu0YyHSO/msVyggKR5dv0sm4Lt0LBAYJ6LnRp2GdxQP+zPdIgkizLh
	XYNzyo4KorbyclEizVdeGkX9bXi6gsWEkahObJ0pt9SSnusK//C2hmCXKbY35oBRS8YHGPv9RkE
	R8x9BarXxIMgUUwr3G+TJjQDwNo8=
X-Google-Smtp-Source: AGHT+IH5D5/1eq7tKffuVTsXsstJ88oBBISErEEeEmo05r1nEfLjE+xOxkfVpeUUIWk3/seDQop7XYmVwxqDCJf8jT0=
X-Received: by 2002:a17:902:c404:b0:20c:df08:9a78 with SMTP id
 d9443c01a7336-210c6c717e5mr215224355ad.13.1730805836356; Tue, 05 Nov 2024
 03:23:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
In-Reply-To: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 Nov 2024 12:23:44 +0100
Message-ID: <CANiq72kPvMQJwCxm_cAcNqtCL1rMYKR_0JR3O+O3+1zUiOdrZQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add dma coherent allocator abstraction
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, aliceryhl@google.com, 
	daniel.almeida@collabora.com, a.hindborg@kernel.org, dakr@redhat.com, 
	airlied@redhat.com, wedsonaf@gmail.com, a.hindborg@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 11:47=E2=80=AFAM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> This series adds support for the dma coherent allocator.

Shouldn't this Cc the DMA mapping helpers subsystem/maintainers? (also
please Cc the rest of the Rust subsystem maintainers/reviewers too).

Thanks!

Cheers,
Miguel

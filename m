Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3A71CFED4
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729705614; cv=none; b=bu4KjSU6N9thl9R6reJelJOKgIMn//fgr/6rYv9DsZIEI+dXj09prfnUrVVxYwqrtALoTEn0LIXATqVk8Z0ZpzmQrzZLPvxM4BKHRmhcJY2ft8InU8aJXUdQNQ5vjMIF3sGt01FIwskhzF+aDDJfEldazxBtqT3+HRPSpre/DPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729705614; c=relaxed/simple;
	bh=i+7ZAlfoQfuCxLYaegZtLOps7LaYlV1n5wy00nEl8Ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4vDbq/ZINa6Zaxcq9mAl5SqS8ETLj752HpFGKnph9E+qkAab1tkYDRrd3Max/S/K1y2hgrjth8EfKN+kNhYeVYAzIxX41OElv9UZHcFUou6zOUDyC59aMqQgrtxM89GCve2mIJGglZyhDXEGRxfS+YPYAbnWQaapFavqQrKGwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MohkiKZc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MohkiKZc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43153c6f70aso264235e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 10:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729705611; x=1730310411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+7ZAlfoQfuCxLYaegZtLOps7LaYlV1n5wy00nEl8Ng=;
        b=MohkiKZcZfLdETBGeL3NBfyNfaFWtugAsSQZDFk0g9qYeWCAR3g3QFyTJgazYqggu7
         yeKUpefqUeuBCao0j63DH/Usnp8U6h7a4AAz20bcy9Wc+P6H5WhLi6ie2ai30c0Z2za6
         lsvEcgxBqzpW3QKTP7qAobHDGHocks8rYbhL6IWDqzMhnIt72GZSZTYhBSlzdYcaLxaW
         T26p+j+oPfBZjM+XGeaUN6ALEsUE68zIKsg8QzOnaO6voaU+TaeHn7zn7yhqy0cn5joX
         DdHtSgDTrWuRFhzeUXBILpXEn1/WIktJNWxzr+4QaYzWXc19cvlvEF3jGsH7emKj6DUF
         6dJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729705611; x=1730310411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+7ZAlfoQfuCxLYaegZtLOps7LaYlV1n5wy00nEl8Ng=;
        b=DCNE5Vpu3rPcxPCTSZvGvECT/g6c4s08uaukZp4Pt8hEFHXS0817Mv7q6Kz1x7zYK6
         XKnv1sz1U/dGsBcZlbF/BWxs8Ovgaey14hTn6s9iDKl42ARv/PT/goyBTKES35TKNn5k
         d4COESJIedhs5MV5lurXM9wqpebFgicyqRz1a/nYGqpcWnQrVw/0w9aZPYm/je3ubusP
         SdAKBzD2HBAbNRKXCMwCoRUpgwdPuAKYHKq1Pq7hxq+VVI3ikTtrLVDq/j01m1+XUZgV
         rXhW6yqTeUFZJkNMO1cU27B4eyZSz3W6WTrgsVdugISZ0fG6Z8qvQ7RJ/mcUUqBtewdH
         FFqw==
X-Forwarded-Encrypted: i=1; AJvYcCXow5Pe0ukzdtPuk0tTJ8f9Rr3USvRo9cnBXuZj6CiYG4/sF/9EcZ474DMNDtJDby2iGylbQ7eVUNYux+/wRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4qRibGBL7yJmOqwYm9U9aXKKeDD1xXFEOcLPmHt3II0F16N6J
	58mlR5v+77n5J+h5TN9WPP/3yLZ1p2zuTcpIc5l5HGb+IP9hueR99fUVGvGdXSmkfzHxtkO7VXW
	/ruAmUUCiJI6v4BgPTYaAWJxxvrkBD8WJvTAw
X-Google-Smtp-Source: AGHT+IGczg9abDGpX4ppjcVsgb3ui7YwoWlv9yFaws8RHe1ZuuGKPzBA2axsxRP2DJ+N1UUksoNEjs6hJSoRSIvhZtM=
X-Received: by 2002:a05:600c:3d0c:b0:431:416b:9ecf with SMTP id
 5b1f17b1804b1-4318a55bcccmr78525e9.6.1729705611429; Wed, 23 Oct 2024 10:46:51
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-34-samitolvanen@google.com> <8fa10131-fae2-4052-b541-e4a6ef570d63@suse.com>
In-Reply-To: <8fa10131-fae2-4052-b541-e4a6ef570d63@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 23 Oct 2024 10:46:14 -0700
Message-ID: <CABCJKufGTitE6bWwoY-5Pr6MfHnPu2m+RVk4UcZMik=Nri-=kQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/19] gendwarfksyms: Add symbol versioning
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Oct 22, 2024 at 4:48=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> I had some minor comment about adjusting the name of function
> symbol_print_versions() and possibly changing sym->name to 'char *' on
> the v2 of the patch:
> https://lore.kernel.org/all/286b1cc5-1757-4f0a-bb66-0875f4608c7e@suse.com=
/
> Please have a look, it seems it felt through the cracks.

Sorry, I missed that somehow. I can split this into two functions to
avoid confusion. Also I'm using const char * to make it obvious that
the name shouldn't be modified by users of struct symbol. This does
require a cast when freeing the string, which isn't ideal, but I feel
it's overall not a terrible trade-off.

Sami

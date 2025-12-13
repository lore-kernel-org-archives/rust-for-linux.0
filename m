Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE321A9F97
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 02:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765593950; cv=none; b=TjVxC+CaJqeRmzoZyHM9dmPnqjv2H5FYxcxreTBLW5nCRDG8sLYDCP8UtNEZPE3zKaUUk2ynKjv7TRal8VZgsjKqV9kUIsj02jBHGhsTjZ/8i4R1o6nvApu6XdMqheJHjQwgIaeyF+TJUXnw5DDsUM4sPMq4ZP5ueQjifLR1MQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765593950; c=relaxed/simple;
	bh=mmRptOd6iMi6JqfPgwEYIRXjVil1LTTWJzVDvQLCT6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7Xtq7tXmjztnFIF0AAU4EwsXIGx63fURUekQd/yBjlNh0BnURsFvgxkEdoUHSrnXzXUU7VornRCXx0MVfI/84DCgTzd+Fnsp9gdLOoWRkGMMUnC1lPDFHQCXxLArJiwWYo4sIHrwxYCoXDqbmOK+FjMBGtL2tGNYnwhe4ZI6hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rHPMgz5I; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rHPMgz5I"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e2d52c24dso975919f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 18:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765593946; x=1766198746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmRptOd6iMi6JqfPgwEYIRXjVil1LTTWJzVDvQLCT6U=;
        b=rHPMgz5ImoJl3yxCuUqpHkzJAzj50C04z5ZHxicRmTlUIREuM0gYxN7kGVMwH7lKG2
         un+get+wC7xc5S8fPGnz82LW4sJRSf37JZ+0OgUDiOSWm8kEc4rqoifRqFMfYrwOQula
         hSVV0xjHlwLjXqWtwu0kX3emycsePdLv/4pUJVm4VJbq2yj2CG5sHbpCcXfdd4ZeY+NH
         Yy45M4vXKwLaGMZzZqYEYDuYErp1CzpeDho+dJqG6G6r4yTKoJvTml3jjwPNxjf/jgWz
         6TISswHkBDTWvtldngupR9DU6frYUnqBLusdHDiTcDNyuK+eTQfcu1RuCm25oZs5q25I
         zl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765593946; x=1766198746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mmRptOd6iMi6JqfPgwEYIRXjVil1LTTWJzVDvQLCT6U=;
        b=ZCOMGzwuSU8CucmKANkeUFCr+VGtGl4rnFRZC6KL1/r49aC3n+zg4sbyU1H+HjdhFG
         TaXeD3jlTg9q/nU73U17/oql8xrIQNZfMB2HD5ktXaZCFCbQzZ3zt8dm58FDTyQ1me+L
         hb/XsSN70vOBRFkO1G9RdUsgh6AZUxliNcJYoujRWA5zNnilQNCUL57/E8zaWznAp9mw
         6UczVI9DnHcNO0ZzAkRn1/FaRSpirRHXSnSSzhl/5/fPbvv48FIrFUetplnME5VckBzv
         dRxlTnDqKDtk2b8MzuXKCC6B2J7nbUA1VIqFJgSdbe97XMjOjLu0eCrIyQN1Z5Jq8r2y
         p/Hg==
X-Gm-Message-State: AOJu0YzmLCkvTidKERtxB9BiOU6jVJYpaaxRNs6umP3Ht17whcWSeXSo
	qy8it/pljk+CY8lMRIVYTH++zr1HNMgqoCVTWSdF9F+Hu65Tz6Kh/54F6DBaKdfePOx4XMq7VB8
	w3pPPVSvCxhXV9C5zM+bo1TgQC6bwKzAu1+vYntNm
X-Gm-Gg: AY/fxX4vDaXKoepPHtZj6HoAW4fnv4vpF2T/V0bn90J5yN/OD3OHO1d8NbJmD2RUH69
	jCrVd1E6QE7WSJmZveVpe6Wo2drju1B0ZpPW3Ap+VOBftpDjyRsPErOW1jSLgs5xDs2yxIR7FVg
	W6Fw36r8JvtHQfgH6SS+Xb06CkEt9f5b+90zbAUo3ekN34fIH+YR6HBDrKS4FCecpMeNXNW4rmM
	VUvvtt4Onnx13PzecSojR6QwjkKnfL0V7jvBV6XyluvZ/bRhJlvPch+XoIftPrlUICGsiz2LJm7
	mkrjudngd+TSSuY7k74d3GWl7KjnteNlfAAh8X/y
X-Google-Smtp-Source: AGHT+IH8BiTRgm1VW5A21FKmaCfjicuLz5Q7a2cM4T+XLuwa7IdB6oLMvkRo2u7Ujznljz6dTrJreNsVYp2Ct5y2X5U=
X-Received: by 2002:a05:6000:2302:b0:42b:2dd5:42be with SMTP id
 ffacd0b85a97d-42fb44d45c7mr3650605f8f.8.1765593946124; Fri, 12 Dec 2025
 18:45:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
 <20251202-define-rust-helper-v1-22-a2e13cbc17a6@google.com> <CABVgOSmmungEf4-FqrBZpxKbje4UG+6C-A9O8Ub76s2uxb6j1Q@mail.gmail.com>
In-Reply-To: <CABVgOSmmungEf4-FqrBZpxKbje4UG+6C-A9O8Ub76s2uxb6j1Q@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 13 Dec 2025 11:45:31 +0900
X-Gm-Features: AQt7F2qcvQoxiwLYGMm1wWwgtFZ8fgK3qcyoxQIVaJDk0INF14VgfcZRgMP0SGw
Message-ID: <CAH5fLgjUMuCUPMuOkgwwdUhQWQVt1B8MZFZq=JcoFg7w5fRSTg@mail.gmail.com>
Subject: Re: [PATCH 22/46] rust: kunit: add __rust_helper to helpers
To: David Gow <davidgow@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 11:12=E2=80=AFAM David Gow <davidgow@google.com> wr=
ote:
>
> On Wed, 3 Dec 2025 at 03:38, Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > This is needed to inline these helpers into Rust code.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > Cc: Brendan Higgins <brendan.higgins@linux.dev>
> > Cc: David Gow <davidgow@google.com>
> > Cc: Rae Moar <rmoar@google.com>
> > Cc: linux-kselftest@vger.kernel.org
> > ---
>
> I'm assuming you'd prefer all of these to go in via the rust tree?
> (But if you prefer, there's no problem with us taking this via the
> kselftest/kunit tree.)

Picking it up through the kselftest/kunit tree would be great!

Alice

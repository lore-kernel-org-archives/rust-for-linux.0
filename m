Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A57146D7D
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jul 2024 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720511940; cv=none; b=bRDbobXm+8Lxxy/jR53pzK7uKeIY0/1Qx/xk6rT7Fyd3MaoUyxWWiYg2fnGATYXHxNidZgpz77ksKqK2LQfnZXrwO5/QSMNMnb5V6+pCMEDjOHa8zr+EDsdKulFWXXEJrHpSX3dE3zlKKtEka8U2IdWH4AHK0OpfCme85ZnWlWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720511940; c=relaxed/simple;
	bh=j8ro3NEFcgtDzgZAdOZgTMMR9ff+cXMjffDa4cE51Bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMDNDfp5HVC7e+Mx5aAYNPnOEQqqFe9xMgju5gqU0m6o8NKCFdFh917rrHXP7vhAxfszjt30ygWRw2LIMO2Yb0y4wZfeK8cLOU8ZYa56o8trbttsn/h2fxEACvAKmjQeTD5vRC9JHC0HTFh53egzmkBJ9KNi0eAw3c3sO7IZM0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHEQqHPe; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHEQqHPe"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2c96170d23eso2860743a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jul 2024 00:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720511935; x=1721116735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8ro3NEFcgtDzgZAdOZgTMMR9ff+cXMjffDa4cE51Bs=;
        b=iHEQqHPeAMQuOWLBTRz6tdFjCk98ksOEq/QAt3P64l/JmLHfEZDzxT/cMe6c4bDzX4
         fo+enVh30QqHrH7Wa5pQmAo/2/f9W9w/TUtJB55YW/Q0UbQ8ol9d1jrH39bbZBf+dzPf
         zwy+gfVp5EG84GMLj4FQD8QiFd6sqydPmpX7vbwIA6ByxKMinhZZZlN9pYveJCoPhM47
         W3AJIHn1c1y0fOJrTbMtyw8x4BCVv6H9jfynYR7LZGGmC598dsqChkdNVu1LVm6JhymK
         mm8jpKgB38HhJcn5l7v9GqOBhc4+jWdkLFf4PqbyIjz8D5CYrrhwVxAO9rFCzV64t+JW
         CueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720511935; x=1721116735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8ro3NEFcgtDzgZAdOZgTMMR9ff+cXMjffDa4cE51Bs=;
        b=B9KccOOzyvZaQGsXHrPQ4VL4XqO8B+twgdotDUQ30omIbAKKfpBGbHGrKgcVrE3zSq
         ZwjyK2dfgIQ4uYD5/VL+Wf95xqaSvGOENS63r9p30Ex1an3cSfTFX6kvwcnEeOPn3inJ
         vIzWOoBPEs4pcJJlNcKkU8ArAHSI3sZJE+tPDi9BVAztqQJ6QLA0D51P0qvaRCvyFFin
         IryYnOy41OqheVwwVS2KEdWOxPxJCE9F2lI80FqAnNTCg4HFuoDR8qqm/AAz/AvcxB4w
         lT0vnOLMQKkeFeYzAehqKuLeUcXbg0oQUj/FpNm8K2xJSHYCh7VXCv5dItpiYkRhwGTA
         nNUg==
X-Gm-Message-State: AOJu0Yzn5TkS58CnD9bTmJYO8zkMuKk/HL1z9vMR4iH8+unP7P59zcNE
	st4QlvnNKfRtt27kHeaYBruQx91pbzvK84egGAPKPoZ/sbrTAPHPi2iXMqRXKcGeAiynoToDaxW
	CTwkgczxdLwG3GIk8+JpJluB/iIk=
X-Google-Smtp-Source: AGHT+IHJNJt1G/Dv1mfPWgivouRIv1R/E8K8VhDl0rOBT7Dv1iZ9VuVGwQzDCtQfx94otcno0JGyNF/WSsGz1nrDgbE=
X-Received: by 2002:a17:90a:af84:b0:2c8:85c:750b with SMTP id
 98e67ed59e1d1-2ca35d3b852mr1808112a91.34.1720511935301; Tue, 09 Jul 2024
 00:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610122332.3858571-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240610122332.3858571-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jul 2024 09:58:43 +0200
Message-ID: <CANiq72n7Aa0hoRNufKuFngbhhcP6k9eGOG2rFVw8r82NijCzWQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: rust: no_std is used
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 2:24=E2=80=AFPM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Using the #![no_std] attribute in the Rust kernel support is different
> to the default Rust usage. Mention this in the Documentation.
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Perhaps we could eventually mention why in some cases it is not needed
(we automatically add it as a crate attribute for e.g. drivers, and I
plan to do so for others too later on), i.e. developers do not need to
care in most cases.

Applied to `rust-next` -- thanks!

[ Avoided breaking links in two lines. - Miguel ]

Cheers,
Miguel

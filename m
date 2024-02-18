Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD4D9442
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Feb 2024 20:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708287849; cv=none; b=ngcI4VNN1zzBElbChl99IB1RNwASSINSgNjojqaW5KrcoiPx1bdJf7NN+Ztg18l5/WHKI/TjXiqtCFRxe/pd3pMpaaim032D8r5sGUy5CxQBcJNENIOJthrhwauqRD6QA9SFTVaVU2k8Uu/7kKp26gg7pDVzVKLNCNhB9Z8ys5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708287849; c=relaxed/simple;
	bh=8b6Lb5DGGJuevVyRrRUna5PztwOyDL06ptG2So0d96A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWnwFekLZDQ1DbMJDDxD/9ETIHXmLkNvx9pivCnuUwAj/6+daLzgNkn+Nf9xbV/4eTxoZrPTwo/Rv6ZV2RAh4popTD/s5tbt8hlqiqy/q/6xq6ayWGjib+izrLdPQuQYJREvvsgHtBwlaCKifg9prGOfYbAyhKbLC4LAg12TTR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkelJ0lq; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkelJ0lq"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so4002901276.0
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Feb 2024 12:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708287846; x=1708892646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8b6Lb5DGGJuevVyRrRUna5PztwOyDL06ptG2So0d96A=;
        b=AkelJ0lquRpu/iHVF9Zpkj8ETJT6AOKJrweDuxe7ifjJ0Jiy5ILDYnP0wJSsV9LF94
         iIa5oIq3BuLsdPFh7WpyW20oOmkHtT52djRa/yvgSVO+K3m3VZ/XkDnl0hTVd7bp6oH+
         CArnbn1UBuLbiXvhEirucSUZjYnRQ57+GwkvyWTrtDQQ2ULZzzZFxoMVb//LA4DNVowi
         2tvz6iVpqy5ee5HLP2mjFyAttqz4K4BihDzPNsxy5g3c48daUls/S/ZcDYMDs0K16uV3
         8uigJyKQFMd/PQ7WxS0sWXVm9NJXQL8vxLXtQOy+0s3ipupRwn7kGcM/j7C44vEiZzLu
         KdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708287846; x=1708892646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8b6Lb5DGGJuevVyRrRUna5PztwOyDL06ptG2So0d96A=;
        b=ULlI7r6hcomXWDN18uojQMnNW/AGTmuHt5sthFjckBv2kL6eH7CQTMjtHUQzn/rJMz
         AHFVzfVqdKggdw/FTX0GDsz51QyS78DiHRzcNXfdGcSOA+RceSHhn3Zke0GmiuJSqeo3
         R3KBTHjTZlABcFt3A7OewwFmmrzycscryGOGMb1xg9dwzkNz5M0VNcRxw9UzUkxDYFGi
         eSUpaoeGYHEQIgodj9NtNuyHX2IZoFnbEyKmG3WCjujdoR/rLQ32QB4AybPSxxuIanCS
         rs/xA2878Q+ZmSsgHfnXSWeq8RL5n7icLOHtDAJXsJqVJHf6S20XbjVt1qXZMzb+9LrO
         eXTQ==
X-Gm-Message-State: AOJu0YyDIDsyrOSWjBMW8EePxc1Lr3ZGZPYi/EPO8i/17CR0O0zoXoUU
	W/YmvKG1+pDrElQW/s9TDYpvJ531TZNQPJqPTzRQ4GSEtYKLeYpQ1LVpsW5AFAyZK8eJA3SD8Rq
	TvxLehcb0KfhVkGOHXiUVXHePRJ4=
X-Google-Smtp-Source: AGHT+IHBti/bM1nE7dA/rKUhT7CSjGy0kAQFbxltj99l6EoiGZ+WQ9NNP5BpXi+g3mKDxkI4l3o32XwzCMd/o7qB4yM=
X-Received: by 2002:a25:e0cc:0:b0:dcc:72f5:4d98 with SMTP id
 x195-20020a25e0cc000000b00dcc72f54d98mr10501607ybg.1.1708287846676; Sun, 18
 Feb 2024 12:24:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130075117.4137360-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240130075117.4137360-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Feb 2024 21:23:55 +0100
Message-ID: <CANiq72=GRUPX6wRtk6ndkxPEG8cXo_u9YB_bmg97UeHfTK=8dw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] docs: rust: Move testing to a separate page
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Trevor Gross <tmgross@umich.edu>, 
	Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 8:51=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> To be able to add more testing documentation move the testing
> section to it's own page.
>
> No change on the documentation itself.
>
> Suggested-by: Trevor Gross <tmgross@umich.edu>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
> Reviewed-by: David Gow <davidgow@google.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Applied to `rust-next` with fixed unordered list rendering, rewrapped
text and headers made consistent with the other documents in `rust/`
-- thanks everyone!

(I also created a "good first issue" about another bad rendering case
of an unordered list:
https://github.com/Rust-for-Linux/linux/issues/1063)

Cheers,
Miguel

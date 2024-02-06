Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2937318F
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 10:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707217042; cv=none; b=TBOogLH25OSKOdRH5xuAKYEaqVkXh9hOKuBVG1986OrmUo0DtTbvD2ObGD+0iR1SaLxUDpuusVggFg1Jg+Tg/UEeHZB/rpk7g+5Y3PSmbA4uAeVsJyP8aAPgjNYQF0LsYjyZuR/iGFBNvNLumRjIcKyKg5n0js4sML5hTrT7EP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707217042; c=relaxed/simple;
	bh=eJt66jeSeHHMDSAOQoRgy8GFzk8SfEwEqhaeCXLEdRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQWd9SK9qK+hDsgzDn5+hfgsP4YMAbYblX6RJXQo+Muw8Vffr5liYmty55FYuQG7pktdEjsy3Eif6XytUYAsu7LYhxYdSCbq/iq32mPM7odA//Ov3E7RdrzqXVINmZ4MrpAvz66U7qzvAFhi5bSjxy9bSRYaJlcootrmTILfRfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpPRKN51; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpPRKN51"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-604545fee99so20592827b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 02:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707217039; x=1707821839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJt66jeSeHHMDSAOQoRgy8GFzk8SfEwEqhaeCXLEdRU=;
        b=HpPRKN51Noj4Mj0XtwrOoeYzkMZQYOF4Tg0x26lTqA9k+5Ntp0SxLrS1oYVXe+S1SE
         cVl5gCsLJljP3xyG9GQPVjUyDJoi0DKVHq44NG0Cc+xXAhf7HYzeAmzJquGZtfuIrRv4
         1e6zbpDrnQK2hkKANODbg6ueb4d4F05k6JqxaZQkZg7mXtRem96Aj50aIPiig7FVxFaK
         1zSR2Z8oHZ0k148uMt+sTaAD5EHGpEMGzJ8gkmD5fTJMyJWwc4jRH6vZuRNKRFqcadsk
         qDC0Vg5Yx4LCz9l1qZKcP9R4+pVxF8xQOiJRjL4tJ8YzFfQMGHioHjsVe+TzSWj5dioi
         AKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707217039; x=1707821839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJt66jeSeHHMDSAOQoRgy8GFzk8SfEwEqhaeCXLEdRU=;
        b=NnmJcyWhCr7ktN8Y5CbMhPvDx1/Rvp3aLmYdKnM0wZpm6h+R7Gp6Vo8Tkw13z3ep1U
         bBudRzzUhx2flQzt/+10CthJR3QBRaYh5zBIdnkOwZk9CeG655lJ8xx8FsbTnvc+a2Ex
         1l3luJrZJfDoQu17tK9Pt98kpYAqcodGKf93Zjql1nB6VFs1XOnAzHM/AHS7u+ZYqkGl
         +knARBB42bHWvusIb0c0j7pReObYL4ACYVT3USdNKMdST7nKb7D2SjtH9fkzEYld80Jn
         gS5KhEfJdM+e6eq5bNcDRtcV70fuwopvftXMONYDMfB56zsAslfnn7uRbcBJ/FwXQpTr
         0WOA==
X-Gm-Message-State: AOJu0YwJ761ksxKSSF4+fLSBhHBiUGsn5Yy+wQUsdxEdplpMiipk139e
	Ri+yShJTnPkrxIqMTn5/YS0AOANdCM6zE2dVU6JNpW8iQOPoV4grDbz91PBycnnzZEmCw/xnQ3s
	gttr8Uk56QEc+J2yMd6jpzEt4VDE=
X-Google-Smtp-Source: AGHT+IGA2MXtYyUZukeN88ZRs3aRj/WrB7oIQc4bgg8FLYP+pN8tFEJBgdTCkkwe4GZ/8szqbX+xnIfZZ1ivyU+DsWY=
X-Received: by 2002:a81:f101:0:b0:604:455:dd37 with SMTP id
 h1-20020a81f101000000b006040455dd37mr1161920ywm.46.1707217039582; Tue, 06 Feb
 2024 02:57:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206012535.480193-1-tahbertschinger@gmail.com> <2024020617-edition-underpaid-4873@gregkh>
In-Reply-To: <2024020617-edition-underpaid-4873@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Feb 2024 11:57:08 +0100
Message-ID: <CANiq72noSQ6pBPcoGZsY5a7NxQFw1tSHVpBZ-=z7CUp0CaTt8g@mail.gmail.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in .init.text
To: Greg KH <greg@kroah.com>
Cc: Thomas Bertschinger <tahbertschinger@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, rust-for-linux@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 11:01=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> Oh, and the compiler will catch this if you get it wrong, correct?

The patch makes it an unsafe function, which means that the compiler
will forbid "normal" calls to it, requiring unsafe code to do so (and
thus explaining why you are upholding the precondition), so yes in
that sense.

In addition, these are supposed to be an undocumented / hidden
function / implementation details. In fact, all these ones should be
unsafe (or even inside an unnamed constant as IIRC Benno proposed a
long time ago).

Having said that, I suspect what you are talking about modpost
(section mismatch and the explicit warning about exported symbols) or
perhaps objtool, not the C compiler?

Cheers,
Miguel

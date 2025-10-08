Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE3027932F
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928910; cv=none; b=VLWG2lLNR8lpItLgnOYELiSG7rUB58KOFntdvW576T1w9ILf36Swdr/ezEt9ikN+JoHX2NakP9syu5hlR+m80WoR5H+nqUqcZSzJ67juhinWiMAA1PgU/yHN04+abjwZmZumQEU5/yXBxL1/gtOMZF29+hdgScVficoMuwo8Knk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928910; c=relaxed/simple;
	bh=hCEpujIAQjzq+71JO1DtwhcA8vBsjBZGICHvXjHGXsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8ynhor4RIXKRUwKrk0Zz/uWaLdm5K5lpw5p2vC7TttXiMpOGNMYY8YOYzECG5FguejA5t4ckY5xxLBL+4otMgkU40s0NYSFXUpi96CQuBnGYkqMKmB612gAc9wOYwxZpSB7OGvBzTnUX3727anL/qOG+rZMQzZuR8FNF0JEXpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XUCwiSES; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XUCwiSES"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-373a1ab2081so61788871fa.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 06:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759928906; x=1760533706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCEpujIAQjzq+71JO1DtwhcA8vBsjBZGICHvXjHGXsw=;
        b=XUCwiSESE+Yotrpsv8pPW/FW3Cs9vJToe9gNGoWlCm2Dw8Pp4BkWO6Bd/DfB7qgyjG
         O4hL0SQPXWrJDNfrNTIL8GMC9zG/YT1Bqcb2pn70Tcp1kjGpkJN9gHCQ02Wc+ry0SB04
         Rfehh74eKgT1hbjQKbcmaC8upPNe8N4XAb4Asjy7PfkQ8o+y4PsyJT8H2BthVOcL4Dks
         j2FbIl1sPUqi92Zho093nNT8AiRLWP1kULtV1I3GTK35SHDJFoVoPTP9R0OQcTQH09rH
         Sd/nomktOOOeLW3UHQaHstOt4cTM29iubdPwnwyysNJu/BVRh2VSLQXh0Aq1CUVm+A4N
         9xDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928906; x=1760533706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCEpujIAQjzq+71JO1DtwhcA8vBsjBZGICHvXjHGXsw=;
        b=n6+lmKRyBLmb9BQ7SL5EGfd2zVqRB0yt9ieKNxYuE+gtQlJChPEk7G/+0850wub4jc
         L0G0tuMwSEwiuhnN+1TPv/WNsnkO1Ewff2pE9n700HcFm1cSX8fZ9SY8xKzl0Z8tLjJV
         8PHf1CdJuE37OqgnYdR7jej0QdsALT0t8qUnoEEd/r1XSbd3KCo2JuOn0PCsX/2Cvu4H
         hBa7ozEaL5hyScG097HQ67Suwqp4AdW17orxDtzym1/dPZMj7j7pROYRpanH6aO1EIgT
         9u9WDA3o/U35LViJyMTOaN+L+kO/Fd+sQhAAuu12KhpyVbebeV9itqIQS+4T4NQdcpSh
         /IJA==
X-Forwarded-Encrypted: i=1; AJvYcCUxjuBpqIwTfkY3UiOnopFAb9a6mfKYSIV899dBt6niJrOG1I7wuY/VEsyLrz45Rg8nIsn2EYQ8iXYjqLHg2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxptUA8o1hW4xbEOA5VLa7VZPMlCV2chL8t2AdfUxkcOEaWoi8V
	w1LD78Z/M9mAnbNFtX0usOvrQEmKNXrBXuL6sF0A69NRePZfiIUAIpRAV28B5QooIQZ6GyFJ2o+
	Xgn4DN3kmoC4qwwKQJNU+I2eUgiARglWD3BJyOqdLA6FWEjMuQkG9
X-Gm-Gg: ASbGncuulgudJPLh+/uiG1aIfjtzDL58RnTUUF+zTMI5uzWmZ1rBUtAlvLW2a0GHGJA
	q3qTG71mCxovIRqu0D9I2kADA0JU6VKjzD5jCWC4ek1H6vqgIJC90X+XNajcHMYI2pGeQucQBD2
	vdRwe7Lhm7id41dIBDuL+joHmRpR3O8VRLAg4jsXuut1DXLWkrUoskb0EdIU7Uo3s+fAFx7gZG1
	GbK7DF5ivln0gru5UmDKb35YKxfCF82wYkI3lH4OIeXi3SkX0MQCGhuqVQbmx7A
X-Google-Smtp-Source: AGHT+IFee/L1ihvsJoJN8qn9mdf5cQv75y1ErzWOfzWMnIXy8m5xgcvGSMTnVzjnBNArGE8jLQiNlkQeXTXf0/ONVM4=
X-Received: by 2002:a05:651c:1990:b0:363:d806:7d5b with SMTP id
 38308e7fff4ca-37609a1a8e8mr7197091fa.0.1759928906448; Wed, 08 Oct 2025
 06:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908160224.376634-1-marco.crivellari@suse.com>
 <20250908160224.376634-2-marco.crivellari@suse.com> <aOZgR7X5ZyXZh_jc@google.com>
In-Reply-To: <aOZgR7X5ZyXZh_jc@google.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 8 Oct 2025 15:08:15 +0200
X-Gm-Features: AS18NWCy8lu9sYT938kbcqk4cxkt4xkSfqGFbSwCDaUGQeBgodxXuFjXFCcOXyQ
Message-ID: <CAAofZF74M3jrWJNZOy3KLyVg7mS7yKzofOUQ+gmmyxYoXbqBSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: replace use of system_unbound_wq with system_dfl_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 2:59=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> Please add documentation to the new methods, similar to the
> documentation that existing methods already have.

Sure, thanks for the feedback.

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

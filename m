Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC4E46AEE1
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 23:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781652669; cv=pass; b=cBn+jAc7UGDQ0VbcMmxR3qw7risDYqeG4noJHaNu9jhan3tTU0f42L1Kbg4EOO+EhT8aX5UlagQH8qKYqIvJ0pcKcmslsxFM6RzNRJmuOMwegSrcRa+qWVoqmiz6MFjdfIcwiUaey7tlJ6xT6iHFzkmhIkiKTtsMc8IU6LeSuwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781652669; c=relaxed/simple;
	bh=TsiYl5/He/sM5ddjkFRRQzvGPfArXdWuppiCaMuQCko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kH5steF8oxn6Pr6mCQZPXjoOzUta8BfjH3S8dYgiiCpvz8L9QXE+R5Twrm+CnMdAtOuEy8uPaF9aAO5aQINjsj3P4UmzZllgxqKm+kce0i1sB1HK8Qpp/iiAedZAIfW0DPZcu2p8hg8iE0yYhIxsncXQo5bWRz+Pqc71dY+Ojgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p1log8tj; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p1log8tj"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bc5fa5a2aso91076eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 16:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781652667; cv=none;
        d=google.com; s=arc-20240605;
        b=cHI+YZVOjwl9B7op2ON7J9osZ7JUPth8pObl84G9/KKiwo8eQhRuagr3ppPjBnp74T
         PLR+yLNCnXbAFCBWXgHhEEQZ0C4BayjKzKbS7+kowk+NBp7UlZ7cdFODI+DRsjx4yQFr
         OiTePC51IIw/5Xe9RGnl6dFY9ojxrQ7cMn3el8eZzd0lBg5WJX2vtdk3Qw2833+sVmxJ
         ZKN9hT6v+auvejMuoJj/XlamzwkSZRHFQA1lmiaeqHi5/ka5II4w9I5sySXextyTC6FU
         09iJEi5KKH6ejoqBGVTlmVNfdQpzmtbFuG1IbaudQfD0HiQqm/6UXO+o4cZWMA8wPMft
         GB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ik3g0TihMJRPhyGJBDL0K/hHuHfn2HZJkN3ciKo0NUc=;
        fh=qDKaddlrfD6mR/Qo5m6ikq8B2WbNaIOshGIRtBl67lY=;
        b=S8QtSRMEBtdDoQ5d7sCcyjgB2x1r3/uQd4iMyvZyYhHyy7DtwKLqYGBjGST+Z+p2op
         C5NzPA1Z2VL6PJcs1Opzg69qGySMyVU/Q9Nf+gnkzgR22DRxHZz+wy/FfF7ZNqmO/TTd
         ThgQeRjAkz1DfqsIcQHEN4OLUqZbt7XHbN5n312pOIKY7fEN1yp23GMebRRfDH5ICWpw
         0jGcOKyW3Ck33QOQ93fIHx2mm4RHJ472G8C1T+yZhp2bLTPKyrSA7q4t2TQ3+DioispG
         4xlqa0peCK8VoMuKlB55YlIIgrs/m5oMeErqiX72wa4QaKder2bikeE143Zqh45jzJkf
         czig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781652667; x=1782257467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik3g0TihMJRPhyGJBDL0K/hHuHfn2HZJkN3ciKo0NUc=;
        b=p1log8tjjq8DoyEmpN4czhBGxB6C3ME6lVS/K25pv9VOqekdnvGd8pAKEiPHkTsvSZ
         X7g/QLpE8pAnh31sqNQc+HOE9BLk3I8OO9oy3UdgrhxiUbG37abHrRFypxQaP+oruWXi
         6jerDtRU+bAhMMEFG6LxbCXB05wfr7innKmHCp/TwkQDbi+hj6aqN7usEhmlCQTnnz9N
         cbzxHc2bwVzrCyj9l7Me0DX4G3pEEpQIe6Xg+jwkgVBAR6CFkJytpoo33BRAd8m8AItV
         dWSKJ7gaMr5Y5zqclJO7ZXncPx8ZCNUt4JMhmo7TPdbyl+V6rxy8m07BPqX/6MHO4hZ9
         Y8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781652667; x=1782257467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ik3g0TihMJRPhyGJBDL0K/hHuHfn2HZJkN3ciKo0NUc=;
        b=N6K4k9QBRhRjSZY72lElLnnK3ydhQjTpdqtwIFhhQoU0TmLY8AR/4J4GaQIzoBhIDm
         qAv+8waoKRNIfPEt+zpMPQyRVGUIpg2j+8OpzwgKTzf3XkqjKLccpLUXTy6hhy4lmXlH
         WaaymX5UrYWcATD+SKAR5O8jRPPfWM0+2qei8dc/wtND3+P4YVNnHdk03uZ06CM3DA5P
         hz2dTjhvNWkzzVvB7HmPlZwNeMAmWAMENDp+YB4u3f8aExJV07c39Ubf3u4MlsiET5Kp
         uBvJqSYzO8rWwAewfR77CrNz4pcyNB2pVpQ/1Ct37RDZSs7ONHclPCkx6whkWsWdu/Jx
         glyA==
X-Forwarded-Encrypted: i=1; AFNElJ+8GRWHQ3Hm3O1JwDP+rccOnVzu0J++BkWcB5SnYNT7seK0A+HBEeI7QthiufxOWkEqgYreesEqnV+U2lpkeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+wu6dl5NRd+w15PM8YPuFbiikpncS9gChb3Rf5yOD8RypddOn
	8QcBCNJvnuDQ15pi3vUX8RpBIx1+EtSbnNtjejqkOEgf1Sc2pihpYW6Pgt0DkjFisfHHuqT+b/Z
	xjMdmbIWYqb/avyU3ga8afb6JOrGL9QI=
X-Gm-Gg: AfdE7cm4n5Rwn1yQ5GJLdezgQq0OE9jl43zaHRy5jc50LSFot0Yid5EIzziXxjZ/nIx
	5zxqX24xiw0wVGx7LMFHriEJOcV0jO0ziQ4kjdXHO6bTdHKxXyDnhBt34Q/mZzJI5UA4Y2O7SNx
	5P2rzK9N2hM8RRd5DSumWNQf5OSE8tyGuXn/qPmAmPboik4nGu8NOA96yYenIbtTqa5H4XeAb34
	dk+KacimwNi5InCBUCfceObtuFRp1S0fYTsN115S/7+O9p5MGf1/ewZ+pRMH5u3pShO+G3R856s
	5qHF3FSavtbxqt0f1YEYZtyNnsv7BTY5Y+eaZZhuOjxWX7el1NACtin2suq7K6tXJ6ZehI3wqpo
	BFQsGfz2JQ/q1zxvOp9Hy7UY=
X-Received: by 2002:a05:7301:100b:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-30bc9f179cbmr438702eec.3.1781652666569; Tue, 16 Jun 2026
 16:31:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611134802.2052296-1-gary@kernel.org>
In-Reply-To: <20260611134802.2052296-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jun 2026 01:30:53 +0200
X-Gm-Features: AVVi8CcFAbBEGqf6i1hERA1geIzmjzb6HdM8IXcihWW_dzhZZW5HQBC1lp4_o2s
Message-ID: <CANiq72murwRsSsV_=M7c8ObpEcYZy7Myv-vKv7+VvYx8eDzLcQ@mail.gmail.com>
Subject: Re: [PATCH] rust: prelude: add `zerocopy{,_derive}::IntoBytes`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 3:48=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> In order to easily use `IntoBytes`, add it to the prelude.
>
> This adds both the trait (`zerocopy::IntoBytes`) as well as the derive
> macro (`zerocopy_derive::IntoBytes`).
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` (for a potential second PR to Linus) -- thanks!

    [ This patch will simplify using the feature in several trees next cycl=
e.

      Gary writes:

        This is wanted because I want to convert the upcoming I/O projectio=
n
        series to use `zerocopy` traits rather than keep using transmute
        module.

        It is most helpful for derives in doc tests; I do not want to
        explicitly use `#[derive(zerocopy_derive::IntoBytes)]` in the
        doc tests.

      For reference, the upcoming I/O projection series is at:

        https://lore.kernel.org/rust-for-linux/20260611-io_projection-v4-0-=
1f7224b02dcb@garyguo.net/

          - Miguel ]

There should no build errors from what I tested, but if there are, we
should discover them during this week or so. Worst case, we drop the
trait and keep the derive as discussed.

Cheers,
Miguel

Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F339119C553
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 05:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780290540; cv=pass; b=pG2KeM/B5U5rEkNl8RDiNBs4AHzXe+9/searGJ0+GlmFcmcJq3EOcw9yv83zvTW9syzJyzjToOyccx1k9ZfLhIkV9KiRhUZchqX6v+sdNczE6AB/wCqy0dn1ZiioJRuWLFT3ae+9xtQETmukozn+g/SBVr6yupDvcQe/5O5Ustk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780290540; c=relaxed/simple;
	bh=DLHofR+qVlmv7Ort/L1Vx7+iDrPzzqDrje4JSlzLPMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6lNgX96g6v4PqwKdvpCjRw/8gayc12kfpsj4BGXiLDASjqb+zHQ/DKC+OIdzE51gQeEVMeSkX5ZzOU1IwbFbdbSslHg2ZvY5vUsPjei287PSfLkxynqENPUvXSrdsqTmFK+KPqrDif1Q9JmUclaXdzsc6lBnb3Lff8kH0Vesxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+/uLBX5; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+/uLBX5"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304dc707bfbso340367eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 22:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780290538; cv=none;
        d=google.com; s=arc-20240605;
        b=Gc3CAaF0qEU4tJn9gGqoNZoKBS57GqmnuwED4fILwti6qty+XwuurWhg5obBjDDbup
         gZIyw4WuM2UUb3Xxtg7gar6ly1aGuuDcc+dWL5jRaz1a968T7gJQAYNRhDUKD+T57+8n
         q6J/OFSgWhsjybuoqp7RIu1lv5F1ePC4nMzO4VY9baZpX5ua5g4QcBdHF7wbWp5Sb4sm
         GtBiP5ov+j5luw7lq26up4jTcgjr3drUb/QNhOdBQgqq89sT9kPEWQh8lOsLBsyvLNRS
         LOmm1RIBTMuQnSVqt/LjbO6Sk6jf7Em8MSZVu9Q/Nw5NWLUBi4rGK7BqLLKJCyeORKDb
         DWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DLHofR+qVlmv7Ort/L1Vx7+iDrPzzqDrje4JSlzLPMI=;
        fh=GJ3uyALPRxOPQsMQsxkvRO14k6RVB05Wr5ytwBHXT24=;
        b=FDw3tgqBcEQIIRoAW+FxKrrX/oXzrpWthkcN3AFhGZE16IGLmm8kGUt8dPh22JYc1N
         kBKyJ8H+Yz+a5tJ+v3SzwkZgEOFsl9ScIgqx9aOo2Mre7VLzAWw1zjm9pVGTdzJ2oYR9
         JKdbHyY8oFmBsLgC8YTqUvlpMN6DBWakH2ioNe68R6zPksb/PkpyD120LeHE7EJqXUUc
         qlq1QQ6lmEUws4iXBcOpztu1Gh7kkGHGQMuZk+K+KjYh57FQvId8I8/fo+z2htmWdxo4
         3ObR/VII4hB/dO6W0sWqAuDkjlQcUo0uDCP2IsT29oz98I48UetnK8tnC+MUAAjYS/4g
         5BzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780290538; x=1780895338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLHofR+qVlmv7Ort/L1Vx7+iDrPzzqDrje4JSlzLPMI=;
        b=f+/uLBX5KXQPa+0TxOXIgvzgLwS8Ek0Ao2dCm+nPv+JySVybyYGYssquL9jkAzDbfz
         GJ64IEO0sOVIcmoavj+skupSCTmCMU48t/T5OxCEoJ1rugRUp0f7nvEOFB6vSg0zBQUw
         QlGSrG2ZcGzm8IjlVTfNjgUPAjRVlrLw+XIq182wO+bIzfVZ19vN5NoCdWfB9QvTaqSZ
         NhdTQvZBiL9NyFW0MinKOb538ia4ACaTcLMwX6v01EheMqzATcsRKBupESLRzeHGNAFG
         DvMovTppR6GPP2iL8E398+Tmv0AQ2quK0eIhugNXbaLhS7HtkyjRbWIXBYz4FbAxgVza
         Ks6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780290538; x=1780895338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DLHofR+qVlmv7Ort/L1Vx7+iDrPzzqDrje4JSlzLPMI=;
        b=Fc6lOp2zReJVoHf6onFfsaNsE/XKfkQKod5qw8uw2zFajMljUY9VtgYlAWYbJWiz0n
         HCHvBvFOFE5kqaRv80XGsiXpbjUZLYdkxEDY29/0GuCgfAjYEEZFG3STYZ+5LwKXfjq2
         OXsrAVRUi4UrpvBOVuPkaFJDutVSVvB5eGqyRzGD2kxtVsrkhxA7kndCQgM4/sf8HEPD
         HVLvP2O6QIYUCqYZb23Ms0i99NdyUF0SSotbRDgL3ncYk0C65i7yqlHtCW0kZWvxvjDW
         osxM8HpaejAgQF+oEj1+XT2PticzHPM0MN8wvBgc5zSOZeATwNS7hZXXu+qelMw/iiSB
         1aYg==
X-Forwarded-Encrypted: i=1; AFNElJ+toG7c2GdGFsyZp+pG1vwrPQ8hP96EtHtjC+8NdvOM8kkNPsxooIrNzgSZ4aw+7jkRl/Ipoar0aZeTpHU9pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAadEY/9o3P4q5fHCnjOS0ijDcbg40AroCKIpyDjZ/JHBndhcc
	LMo4l7gn61Do2oQXhZcyGRrCFDpx+dujhSI8k6zmS41x8m/ioqd9xPe3vMzHvPrOPA1gmRazT0Q
	kGwv26/eoI9WxDMg3uNVrkAmY/lFVzQc=
X-Gm-Gg: Acq92OFlOXeyh33/X+/J7UzWV+NT4Gwe9sIuyeD/2wDO4irUTT983WiLj6lg+Ifks6N
	8thPr57A0nMe3SQIe187MgIkqYx23DyPzPJK0NF8PlJ+IeTttmVCpqaenIIO1GG9ODXM2NxiI0h
	4jzZxqifLUgMyJ3Ap4nnjXd5X7hG3DcQE55WNluDZVpDF7qnSEyD8Sd+2sQftXJ3oKby5InKVK7
	dAo7MxKZtZpQwVLffz7OEqGUtRW6QUtCUjhijwks5JX7BlsWUvw7kniHeCEL+jCQDdgI1wykIfu
	xK5a2qkkYVT2BRtXDh0WqcPJNfncxL1QJm1EPniYTKDnYUez18ox8egltiMMdkqCMQr40p8Y3ak
	halS3L31/krjrqhOYlnuwY5ymXkXtRiaCaVS+YRO8ZnVj
X-Received: by 2002:a05:7301:6785:b0:304:c73b:79fd with SMTP id
 5a478bee46e88-304fa68f723mr2267873eec.5.1780290537929; Sun, 31 May 2026
 22:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72=huc=AfjBRYUsoJY1hSvB8W6CvnUh7g2G4rt98XYmxYw@mail.gmail.com>
 <20260601042304.73316-1-contact@jkam.dev>
In-Reply-To: <20260601042304.73316-1-contact@jkam.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 07:08:42 +0200
X-Gm-Features: AVHnY4KsJdAwzSzsNpk9DG5c5vtCbfORDzKMj1SGXLhQYJA3jZph2tiTT1IJCmI
Message-ID: <CANiq72meRS8rhk_DgHGrmphLBTdch4wFwZQS7jcx6uM9a1YvKA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for cleanup
To: Joel Kamminga <contact@jkam.dev>
Cc: a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 6:23=E2=80=AFAM Joel Kamminga <contact@jkam.dev> wro=
te:
>
> Thanks for the comments and tips. Just for future reference for myself,
> in regards to applying changes strictly to the metadata of the patch
> (i.e. adding a changelog but leaving the actual code unchanged), is it
> preferred to just resend the same version of the patch with the
> changelog added instead of creating a whole new version? That was the
> impression I got reading through some earlier patches, but seeing as
> I've been creating new patch versions and haven't been told to do
> otherwise, I figured I'd double check.

Good question!

If you forgot something small in the patch, especially if it is
something like a typo or a missed changelog or similar, it is usually
simpler to just reply to your patch and mention/quote the place to be
fixed.

That avoids a whole new version for very small changes, while making
everyone aware of the correction. So if a maintainer applies the patch
earlier than the next version is sent, they can fix it on the fly.

Now, of course, sending a new version can make life simpler for
maintainers, because they can just apply the new version without
having to manually handle those bits (which can introduce mistakes on
their own). This applies to things that end up in the commit, so it
doesn't matter for e.g. the changelog.

However, sending too many versions also has overhead for everyone (the
emails on their own, the tracking of each version, possible parallel
discussions in different versions, possible feedback on the previous
version...), which is why it is all a balance, and it is usually
recommended to wait about a week or two before resends.

I hope that helps!

Cheers,
Miguel

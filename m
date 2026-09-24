Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3924BB288
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265992; cv=pass; b=gzrDdEmb53w2NS5qx0tk2youBeeUZ8Kf/zfieu9M0sZKL6HGAMf6CmYK8l1H10nM7Nq94JZhnW/yEDMw0ZUwoqcaA77m3jdSP89ROGRhJOk2/7MQvGOB9cB+Z3uFbP6mz1NP8twk1JrDHHT2Pgoe7f1Gd6UeCRDurtg/wYJ04z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265992; c=relaxed/simple;
	bh=s87PL5rrwrP1hfiGb5q93550+Hv8VMpEJj1mpIiTKCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bG9evnW6F8Q4X+cFFJz7TIkSKH56zpkrwPBPpfUSjp27/8wNYXtXDfaf2TJhKXGtR9jU9/GImxK2dGknoe5icFuGl8xlGARFeJsFVZGD++4AZDNsHI+IzQkr60Gt4kWIF2YEWbv064zEBYZmz9aWLRPFrWKyKs74wR92om7qSE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lO48X/LT; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lO48X/LT"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0dd550aso959658a34.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 09:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790265989; cv=none;
        d=google.com; s=arc-20260327;
        b=Td5ss1js7JcFCkDfM13oTsRD7dJvHI3nTkke69VLUZmRJVg+TCQ3DO9buy6pVd2DeN
         o2uc60ACQob2cbxiI3W0cdZlkfgcKmzSY2JHHpRmKgAcTL7s4VHXIClzldJYnh5Bmg07
         DKe7qucqJEJcB6iI5HyJM/FAfTobHxLamHoWfetUZmqVVSdqBmc+y/KBdTuKZjmgtdvS
         gz3Xz4JfD519T0vV+4HvgimU35BufPVCRC+PELAGyAYWzrbb1cw9e32pyJTRoHtsLcnI
         WdhAUjvJpB4HHJ48Uor6YQ0MQBSMrtjyxgOt9JrqjtgoyFvHINPIwPHtBkbz3O3b9C31
         It2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s87PL5rrwrP1hfiGb5q93550+Hv8VMpEJj1mpIiTKCg=;
        fh=Z9f9FVybKYS6MmYvrQlsvgp/EJlAuA9AJozHlTKkgTk=;
        b=aB1FOzrj1y7fqOr9t3tzIN6arcqvH0ZtMmdvC6fs8KyFQj0dPk/vzK4AfH8DHbLrWB
         oIhpQQnh0U40jCqFkFtGN2xBpor2nSjwXHPRxSN8jDrRZEXTDzcUAyXHX9VR1X8UXoGD
         ukLW6bsxGMGy519+SinEjpwG2DrmQfDtdpYoU8j8LUXllzFf4hUtUpGc732rRCp2p584
         KzwFNP9T137CIXYfZsUjRcC6nH8eC/du9eMINRMpH/OwiCEG38ZVEvq//6d2TfM0tpkE
         Y6TwNT3AFU1NJFRIQEDRKB4H4oVjL/brV6O+7ARN29+xLieJ5b//mYxMRPjwOa+T7F5h
         +wQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265989; x=1790870789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s87PL5rrwrP1hfiGb5q93550+Hv8VMpEJj1mpIiTKCg=;
        b=lO48X/LT9dqCaMQDc1j6i+bWX1ERyN4cgsOxZb01EAFQT7lJvIgxoE6mvSlKj257Nf
         qeM7PP5RtKA0hBoc7oqXzpIFoMlEanm+PGG+Ny1S4LqpvXWa6emxuvUBIr886XUW5IXa
         Limf76gud0UEroF/+cpsKrbYnXF9j57Ugw22XU6OIspFZvrrtJVShEpqrImoumEfJxs7
         UOmE3XoqQEEDeldjagGFPenIWf64el1QpbBRTkcozaFDkXx5RqW4OuQIUAf0TZSxSD57
         RwSoY4jroYCQ7vooDkvz7qOeeqdRylE0lLvERLbTkGDvY5bjd8OEBsEPTbr/U+kpZxs5
         n8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265989; x=1790870789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s87PL5rrwrP1hfiGb5q93550+Hv8VMpEJj1mpIiTKCg=;
        b=Dor3PIFCqQWqwvjuuKwLnGE6TbesAol/QMOzBu/dT3T5LYYa8+Lsb+EmHx0EWuPpao
         TxStWfX+EaYyIli4ETf+vZyLxkiEKImBmX74VQHFD40HkoE6/U1cF07/IYWFmosDGARo
         w+sLikCcL00l/E1RY0Z+G94HSmDYXSPl1nJD9GhnWNuINdE5DtV0upnltameCj/PXb9z
         Z2vSuIgQmnDp8b6vFoijB0UxqQa0D+KcMSGaUACAVv9GiY10gjjnL90EB7AGq/wTclnI
         DorV7Fhov9sjP5RDDMI3QCfXpBYKFluLQRtvdmSOWYL2epTBDx3j7NwHijkpM7ZQ4mmW
         93ag==
X-Forwarded-Encrypted: i=1; AKwUvBznk21lGpL2Ieutukw1zr8vRgYfIRvComaERrFDcz3STwlHJNFRcCBTgSDAcx1KZax61VVnNtIO6gaWWYphiQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mpwk8y/36VBbqJ7zaFlLb2G5DnjUGpXhjD79FIYw4wyhrcii0J
	Evmy9bB0aYT2wg92E/ilfJWSq0SJ3z9fYpsn5Armx5o12qohmBvfbQTK/S6Pch9UdiF1WhsL2gz
	yjNvEgVwwCAHS5RztISdvtRrKHiuCW78=
X-Gm-Gg: AYBFou0m/57Fd2SHmZ4B8Njipfr0EPPijssu6aCQXZTT0DqGWSjVo7r4MUVK20wqkXJ
	WXyBKsKA7rKLQq+nWaEbPDtO+T07cE7irQidaPLEQMLSClRo7Cegf3FHFbMrMZu4tslHpPmWMHe
	8wEz3IFgCc2xneZcMIrU2TaFVsH5WXOBAdFkEWlwS35FbvVuUPp2VWWzm6SfgjvlFar9VVOfJXj
	astFbZdMXnJU3X+7jVEa4T/qvp3X1Fl5NKRWQoWvgRuXsFoMOdXwXnu2HFtz0Q1yP+sq5th1KyD
	fR7DWpds3r7CNxgubul+KgW3ssJKgyrOPdSteiuiL2AObX4tU9DWw6Ju/LPzhFbz2YC4vP4v9x9
	eq1FHRqwyO5he
X-Received: by 2002:a05:6808:5395:b0:4b9:e5fa:8a11 with SMTP id
 5614622812f47-4d728f2aabbmr2804188b6e.22.1790265989379; Thu, 24 Sep 2026
 09:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923022339.3340694-1-georgeandrout13@gmail.com> <arThye_219ruNbM2@google.com>
In-Reply-To: <arThye_219ruNbM2@google.com>
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Date: Thu, 24 Sep 2026 12:06:18 -0400
X-Gm-Features: AclHuK-lOEBKK9dYOS2UY00MWakjMDOvzU7dNK00ORx8tBpC4tNpOn47rwDC-Po
Message-ID: <CAESH5ocJR9SLHcYfusixDmOR-CLce=HTpLxFU7zVQZFPtD9uuA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: file: handle fd table teardown in file
 descriptor APIs
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Jan Kara <jack@suse.cz>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 4:39=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
> This looks like it should ideally be on the C side instead.

I could move the `NULL` checks into the C helpers in `fs/file.c` that
currently dereference `current->files`. Since this would move the fix
into the VFS code, would it be okay to send this as v3 of this patch?

Best,
George

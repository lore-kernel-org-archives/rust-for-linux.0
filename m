Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB12C347514
	for <rust-for-linux@vger.kernel.org>; Fri,  1 May 2026 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631099; cv=pass; b=pjUaupsEtRuzmUptjUgh3vPpzTL4He8e+nNVThdEmxXBZM300b0rcJFlq9RXOe/oBbaaTBjGfEuJfqucahnT5dRLiwU8/GUB1tmxFijKIL7sxJjwsYIKew1usMpCHQcVDgP4IOvuYe0xaUA7YnmV37QPp7HhDclJD4BvrvuiBeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631099; c=relaxed/simple;
	bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtWq5ed2l4MAxBiZNptSBjK5o9dN79pFElicqbUumLiOeyPsOCR+x/DiGuMahWupTYb1lk0Slv080Z7OHdF1BrrAmeKpo6hJY0rrzCG4zYJMph/Da34Sv3UcvgtJUqfySREWkvUYPDMzpdZ4qRUdk6Du2/sxxWhzhD9ZoHsy858=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pc9ksghI; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pc9ksghI"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b8095668ebso94894eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 01 May 2026 03:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777631098; cv=none;
        d=google.com; s=arc-20240605;
        b=QNTD2RGYeAAgfsg+H2iPHDExf+CwXRf7KL8/nnKGypVo1l7Nsv3hEIJkYWpFVaKfDr
         g2UfeRfmOO9mwttpcsc5musBeM6PhiZIHvAaaCHYYZAM1Csk1W+PfJX2Z8GINVSiUPw0
         PeoJxPIE9eveAbYFFhfojVMVkwaoVuWzFNaHjggq9Jq4HXIcMDtmK7J7u57B6iGfJ6qN
         IlJJssEL9Z6D9CgWRUZ46ZmO134G7GLEFkdqMblfqx8kt8wsEiM0cMsaF7tQq3Cafosh
         vhvNwWuRAll3+a+eMQolnq0gwED+NCqgnTaofA3a42P7cxsEZ/vlk6wbMVHe30fmfv0M
         e4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
        fh=tbcb8V0YqNW91smyl3GnUwN7Jd3faNw06383BVliLV0=;
        b=YzEkFpEQv+GIZMArWOnjKnm3UKPtMBkJXV6S+Ni0SCLuAlrGRpO1aTHXcAMrXCJJnw
         +xdV3uDHyYjfLlwpbk5HPk54NjXVuy0wQ9RCihiFlbKfcGbjIr5GJ+YEiH2wOhOPiU06
         UISH22yQXKNvwoVjQ8XswkQ1ZCc2SPST6zXE/22ZW+5lmgXwKIc7F8voT6Sycdk79/SL
         W2+Qksrgj3rV58wiwg/O1DLNIsxTxuCsApc8gj0bBkPpVTtQi+6SSc/3jdsXz/VDJEHP
         L6J3RN6QDKsYuMX+gJNwKxhNVrLiM9KyN0HgAIIzI1xjhTUWU3EmIsZdSloYyG8qXvyL
         iDog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777631098; x=1778235898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
        b=Pc9ksghIlsy3Mj5xhgNHIVY3QWJa3GGnUDiQRAMU3scgzDLEFna6536uQAfzFY9MHZ
         orWQd72Hl98oWd0o10YoH5CWlFpzwUZ3k9SWKoHO9jQqCswRZfNsRX6/TJQ4D4juqh2E
         CjDxfQWAiOckhwMu4AO2yTK6utD/rikV1OgxxDi6F10bO+RgpW1vvcLJyydyP/6k5Mr3
         k6ehzG8dR8qHXGDX5QbcIz0AxZKVCqMnpGhCPjtNGSiQTJji07j6jEk7eMGyl8gLl4I5
         zmYqJHXze0Dd7zxpR+LlDVuN20OpiHHzo7gpvxhujr6MDnT3NxBLpjdwJoG1b3Eif3a4
         cUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777631098; x=1778235898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
        b=XtgocbsCRIpFRXTYLqjYi293QOJCA1kNzjZCbcMDzmrVU7Mh1LlPv5LBUfVfgROHJO
         zYSU8Ut91L3gl0K0qr43NlNPklT4YzJleUakEPvoNZmEt8YJfffnsF7llypkfY9rN4/F
         p5gzInJiBRYGwwtKitvcCJR353/dk120VOw3eCQmeT6q65pilDsgW2PlOtFOEqkmB+jq
         lj0C9rPMTN2lGaLGS39f/vmB4yk4gsUdHGW9+m/Q8ZpEFt4AH3YTw0wszMy3JDD3BRrH
         BSphcwMs2tgUzr7ITW4p380V+mi0hzonGDqapbCcr1JqXZYoPF4YodzUWrJ+6XXUrY0b
         SPGA==
X-Forwarded-Encrypted: i=1; AFNElJ/Trz8+Hqv/SoqgFLs1eU939Ao11pDfqlZT4//qpC7JV4wKIZQV1nglTgmL3i+lE4azKO8gDqqUtTMU/MN1uA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznp+Gua/+7IpdhO+65YVQPh4xZRUxMOY3c0iEKhMfexS8aT8l/
	iDL596QwUNgOfha/m2W0f/fYMvtAVBMLGh39RgznCDNqzUaVYElY3OMelnGS/e4nwAMebto5KYO
	yrClhqpR/E/c3PXYkXFf62a1rTUao7BE=
X-Gm-Gg: AeBDieukqBFAoUB+3/MpCSWcOqA1L5MYvB89rIwrQ3YVXE4x/VIW0HvywueY5XYSA/4
	miBDp2GirEIMCqB/3UkMiWqeen9z0CRLAhCfC+DjG6SrrDqctWh46h0aqPQHW22NhC2JDpSgLXR
	z6yCmRdvSGo4r3n1To2Z5AlKU4NL9DYn1hT44j2rSl26ZLwnhZ63urGbLtJJ9X0BPeCEGDTNGMI
	N6f8hQmrLUWDkxe/kAcvuKYifbqgA9/gnE3qautXLSsUxOP4i9i213nO2fctZh9kAY4zm+R9Rtw
	TLVQgIVkSUs/U+QUaRH2V7vVSGzTgKtO3jTCtEpkZKwCyvZhvfj9QXSGlCd2rmFsThaYajqtwAx
	rKBdl8kTHWc7+ndMmlHNyssL+ZOzbhBadsA==
X-Received: by 2002:a05:7300:e128:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-2ed3e67f9bemr1559146eec.5.1777631097781; Fri, 01 May 2026
 03:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-4-7ca31664e983@nvidia.com> <7a33e348-4a08-4f80-aa6e-c684b4d7f1c6@nvidia.com>
In-Reply-To: <7a33e348-4a08-4f80-aa6e-c684b4d7f1c6@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 1 May 2026 12:24:45 +0200
X-Gm-Features: AVHnY4JU-fOQK36-2tr5_8MPKm5fMckRl4BPWEv-q30y-1R-UoCYMfDc0_YhnfU
Message-ID: <CANiq72nuGa7x21DcKr22ghi8bfrbATrBhcq-40zQ=3XJEVV8tQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpu: nova-core: export Rust symbols for dependent modules
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 5:22=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> How does the rust compiler know that this function can be called external=
ly if
> it resolves to no callers within the translation unit?

Like Alex mentions, that information is what the `.rmeta` files
contain, which are generated by the compiler and consumed by the
compiler later on.

They contain stuff like generics that you point out, in order to
actually use them later on, as well as many other things.

In a way, you can think of them as opaque, generated "C headers" with
all the information needed to build later crates. Other languages take
similar approaches.

Cheers,
Miguel

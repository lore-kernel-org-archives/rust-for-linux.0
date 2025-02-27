Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC61E832D
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740642781; cv=none; b=eRCB7AD5hqrLjkSE4Vd1HJKEFn7iAUnpPB0NAr02/E3CRr32YCaLVX7ihdw2FM7LnQyBMHRP+SzhGKBAXoxDzKOyKrdATLLzFwrRNO0/l5TgO4INZaodNEo+CEInRjUnErFqSeq/uyASgQ8BUtY3IoymPLPs6S+WotUXnSPNPIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740642781; c=relaxed/simple;
	bh=WAve0K61aiBm2H/kJcL9Z33ely0mkl7umME78jtqWNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecvsZTwylBtUMP9GGR3bZK3sHicrHf0VyfmjeQUJWNqYti6XtJdy5gChgsq1nLeepgjscYxue/yDsDk0ozFWv67w2kD7BVS1dv/WjExsI0yBF7hxpnwIeRo90gvCI/GvwaowvpE9KWDexgp6e0wn3knyIshYQNtDUdJQY0D1M3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SXOLHzql; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SXOLHzql"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so292160f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 23:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740642778; x=1741247578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAve0K61aiBm2H/kJcL9Z33ely0mkl7umME78jtqWNk=;
        b=SXOLHzqlXhxb4jvoRIJJaRW67+Z98sGduAmYGrPWU3Nv3sqgsuWk5SGGYZOIJNweKv
         jZyVHAFgoG7SwGXnIhbPxSLO8GoxDQzEEEUp4EJJCnyj/xFWCRAA8DnqbvoKrFk1pEjY
         i+M5RNocw+yifwWy7D0XS6xCsYcA/p0TN5Jt0k0rhB1vGZyjwFHeyt7waolqBXl7wROH
         upGc4/G4Wyp/ObOZy54Hjwy5BSCKBUIbowxvSSQkUnxMnLOHEFp+604fLOCZouQxcnLf
         6nDfRxTb0sUkhHTbgpIBYFGd+tfACLBqmaZW8sM9rUe03FevcsAYOcAtVJeaOAmqUfcm
         u7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740642778; x=1741247578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAve0K61aiBm2H/kJcL9Z33ely0mkl7umME78jtqWNk=;
        b=VPKJfuajSNNvQrB0iToZcTob26DLbof9u3DvAFkcjDIU/YLN32gmHQHG83tvslspVA
         6g+FzPLjRqfd+FqJl3pYzgJ2v/RBZJz/o4wmtunmzbNY7JuxsapQJw25MTXfASPrewSO
         70CCng/flU4zfzvLIDMzbOJcJplQgd5CsHbo3JmZH8Kb744ILxSfoT6kCHtTBFhzWrRn
         4rzmseyF2BNu5uqAYtmj/zJV0wYqMJj//fkOrqi/PbdnwU+EDLIfBqUv+qOgXK71mN47
         LTfUZPGqn2d8vYrXNdvRawL7IPfUM5EivGnLvFgkS8qosHJZ/Gsjx+C0RoDtHnZJb8L1
         SQjw==
X-Forwarded-Encrypted: i=1; AJvYcCXFp0r6mqN2GBpjB2ZcToEnLz1xwQS59rmvcOpYxqGUSRhrD16+knnDOuwewJxzgBap3Qt2+xQBxVtHXXp7ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxWwaEZeBDSNowZ0tYSD/89ZdSZ4BPEXjf+qssFQraJ16VxNG9
	g8aPSG61czjh0L/F8JPap8dK5M0zcm3t+zzEf+oPn86p5N3dawSmH9pzzSaBY6GQCKMjEOlGo4b
	M5cU4H3m0XDubur35K4OoJdWMgHplVKCTtnOo
X-Gm-Gg: ASbGncusijKneV64CJ5KSmOu5LeUl5G4TzDP6dhTJ4QMiHW7vJ9C30xgX5Z+B9sFgeB
	J4I3wHYXByne4FIPSliEfYcDDzZH6mnBMIF9ayrHCk12wrnnY4Jqj0LN3zybqYH0e7y03xWCE5e
	gz3C57cWS+
X-Google-Smtp-Source: AGHT+IHq/W1ckseU42DFdamVj9VolCNCEVXVrOQeYw+6Bv1YqodQtI+E8O2KwTAXHPbfpoMMUid6060aOourekauJZE=
X-Received: by 2002:a5d:6d87:0:b0:38f:4251:5971 with SMTP id
 ffacd0b85a97d-390d4f367a0mr4807927f8f.6.1740642777735; Wed, 26 Feb 2025
 23:52:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227030952.2319050-1-alistair@alistair23.me> <20250227030952.2319050-20-alistair@alistair23.me>
In-Reply-To: <20250227030952.2319050-20-alistair@alistair23.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 27 Feb 2025 08:52:45 +0100
X-Gm-Features: AQ5f1Jqr2f3px356CRZa1JK9YL4d2jGf-uxwiU32ka-YgAtLTMIEvy1EGdGheLc
Message-ID: <CAH5fLgjFvm-+jVpBsgU-sgOOzHic9DvcUMMg_z0G+37z5DWbPg@mail.gmail.com>
Subject: Re: [RFC v2 19/20] rust: allow extracting the buffer from a CString
To: Alistair Francis <alistair@alistair23.me>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, lukas@wunner.de, 
	linux-pci@vger.kernel.org, bhelgaas@google.com, Jonathan.Cameron@huawei.com, 
	rust-for-linux@vger.kernel.org, akpm@linux-foundation.org, 
	boqun.feng@gmail.com, bjorn3_gh@protonmail.com, wilfred.mallawa@wdc.com, 
	ojeda@kernel.org, alistair23@gmail.com, a.hindborg@kernel.org, 
	tmgross@umich.edu, gary@garyguo.net, alex.gaynor@gmail.com, 
	benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 4:12=E2=80=AFAM Alistair Francis <alistair@alistair=
23.me> wrote:
>
> The kernel CString is a wrapper aroud a KVec. This patch allows
> retrieving the underlying buffer and consuming the CString. This allows
> users to create a CString from a string and then retrieve the underlying
> buffer.
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

I believe the idiomatic naming for a method like this is `into_vec`.

Alice

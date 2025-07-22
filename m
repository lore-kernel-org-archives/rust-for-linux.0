Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC102E3AF4
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753184151; cv=none; b=M262aeznBmQanUuoRlp+smHDrclow+4GVR5xPnhZ629S8rPxTjqsM1+hptZhlFzG/2sAzjkD1bNWfl7Nr3RDop9LQOizGlPG0SOIPmoOJn//UNcsYTBgoca/T/vSyVl+xxmGygHuDTfEyzRkVq542cAEVY7gEudzwv7oQzVCnC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753184151; c=relaxed/simple;
	bh=VJr8/zUYv42eURdRwV2GrHdHUy83vsFYT/2gR1d526c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uX+ZElizXh+7ef9ytXMB1qB98cgXTLkcwFNMzgHCwMQoB/KZSu4tU0G8PzuwbObPgrwv1UG2RBfIBnJZjgSsutQFw2EtbJ4xMoXwQIIzRs4PAFxOClJcXjou8a23inC98b8FAv9rkKrOIF6qIatwlWJR30DoXM/vFzfnXcYv9bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MYB34a/z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MYB34a/z"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so37782975e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753184148; x=1753788948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZTJ7kO5Udqug/M4tQcu+r5w0N3LOfdbzdUXVIngOwM=;
        b=MYB34a/zgNPt4h5DHqd5KrOaTkHt/q7mdISnF8UgWigIfrdrn4OILf56IiDQw0m5pq
         u+0VSx3PvanPWzSFY5sZ7t5BQC2GSFhL5/Gfq5rZuLN5bP6Ll59Domqbq6UC9sed+Bsr
         nvKj3nd9QR//xVa7H0cbZKRNH7fujGNUcrcSQs5LBKdak3fv7AqleYMTSLtUiMWdCHDn
         0pe9vrKU9yywU3jHKVM8xcLY77U3wPy9ABJ4y72IP4mOC5e6Kdbo8K1xwIndbiQEE5jk
         CkCbPydk12d+qC2VhcmulpmoZPXnrzRbpHOmZpAjE9farkyf2cdJrJvFDQPJlwRivplo
         eWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753184148; x=1753788948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZTJ7kO5Udqug/M4tQcu+r5w0N3LOfdbzdUXVIngOwM=;
        b=soif3njjGQQe4Q2qYos29bwZyZz7RyItDuV4g9UaBbgpjhbxDoU/m/6hEGIEwn222o
         qa/Ts6Wvrvea/EHkjB2wZyKlHHdGwn+h32NX2busCy/pWVEx3mwJKEMuMumskL7IsYnx
         QXsNwpozK++hOoTcpkbMVc9zJk4Fk1eHnq5VgboSGEbbGq/lT5ghH/JXKQK/t9baB2gM
         qDHV3ln+fzt7FJ35DOFw49BW8sQhNUflLhfObiCnLFmN3w0Nntnmh6SjsiLt7PdnWYGh
         5GkEZ4Bf/945N1gFD4aLrJhTTF/H9jATPuCj+Q7b2TMQYAzg5WuF4wrVrMQo+O5jw4qQ
         rcdA==
X-Forwarded-Encrypted: i=1; AJvYcCV1811hYxyEaN9Ydbv4Bf3X72KNnuHN+P0+9KyhoEw+tcjC/x41W/VgIEvaMpAhGBUoSF0hojoRdTGPwRLbbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuDYWrRaV8XV0SEmWzmDmN9bDbt2axmtw9Qua3iEbABB0r2vs9
	IRudk4/2W2SVKh89WnE1GKgwC5boCdvApsP31s92VoZauFR/bB1e7pXmpiFJ5AT5s1g4AclTjX0
	LlZsfoSXr75jFdViVwVK431h+Jar8sQoHLhyCo58tl9nN4XI/Fr/SCVGc
X-Gm-Gg: ASbGncsuO+xfIuypsgDqF/+bAlE/NpdWGqCRTGjaOpdEIiL6COms5GK4fgH6gW54ptF
	/6nJRO6d0oj1eOxS051X3f3wysYWaap6U1NXfAcFUBAFfVc+jFEfw4+uK1labs17uv9QkSLvM5S
	9Rnw/1d6bO7luadlBdiBnik05HtuWJuqpQMfLvcb/vakPRYMkiARxCLWyg5yZmPq0lqRf/RVb47
	qjfv4Qan9TSyWBn42cKEt2CaSX6+WQKpwj0wQ==
X-Google-Smtp-Source: AGHT+IGgqbkCPuVbYPe+sB1xchcaAFlfb8rg+95dWf0lrVkAlbZIRkWKL6fzRgYKEH+kd9BAu/NP52Ff/2p+uKE1T24=
X-Received: by 2002:a05:600c:b86:b0:456:1560:7c5f with SMTP id
 5b1f17b1804b1-4562e03e710mr253355155e9.14.1753184148237; Tue, 22 Jul 2025
 04:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710022415.923972-1-apopple@nvidia.com> <DB87TX9Y5018.N1WDM8XRN74K@kernel.org>
 <DB9BF6WK8KMH.1RQOOMYBL6UAO@kernel.org> <DB9FUEJUOH3L.14CYPZ8YQT52E@kernel.org>
 <DB9H6HEF9CKG.2SAPXM8F9KOO3@kernel.org> <DB9IQAU4WPSP.XZL4ZDPT59KU@kernel.org>
 <bwbern2t7k5fcj6zxze6bjpasu3t26n6dmfptlmhbhd7qmligs@3fgwifsw7qai>
 <DBIHP8IP3OHA.8Y1S9ZV1Y1SZ@kernel.org> <DBIJ3POBANNM.KSO1I5557PFV@kernel.org>
In-Reply-To: <DBIJ3POBANNM.KSO1I5557PFV@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Jul 2025 13:35:36 +0200
X-Gm-Features: Ac12FXzTL3fGKYzXEGiHiezw2fRDCeNwa0F97jFN7jJcBA3qdOvmZ51updJGOtw
Message-ID: <CAH5fLghic7MZd-BO=Z-ostGLgWmBciQmZp9VjQpLGWskFK_gyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: Update PCI binding safety comments and add
 inline compiler hint
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 12:57=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Tue Jul 22, 2025 at 11:51 AM CEST, Danilo Krummrich wrote:
> > I think they're good, but we're pretty late in the cycle now. That shou=
ld be
> > fine though, we can probably take them through the nova tree, or in the=
 worst
> > case share a tag, if needed.
> >
> > Given that, it would probably be good to add the Guarantee section on a=
s_raw(),
> > as proposed by Benno, right away.
> >
> > @Benno: Any proposal on what this section should say?
>
> At a minimum I'd say "The returned pointer is valid.", but that doesn't
> really say for what it's valid... AFAIK you're mostly using this pointer
> to pass it to the C side, in that case, how about:
>
>     /// # Guarantees
>     ///
>     /// The returned pointer is valid for reads and writes from the C sid=
e for as long as `self` exists.
>
> Maybe we need to change it a bit more, but let's just start with this.
>
> (If you're also using the pointer from Rust, then we need to make
> changes)

Honestly I think this is a bit over the top. I wouldn't bother adding
a section like that to every single as_raw() method out there.

Alice

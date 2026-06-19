Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A2229B795
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Jun 2026 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781853590; cv=pass; b=evnU/ElUCgwmhp6gTw+5Ropj138RPcWc5CythPkKqYbAPfjFWtXbxE4LTGLjs8WPx9vbBqcs/jZeH9lr95/Hz9CS5wbKpWfSthzxvKVvCJDO6U142vRIu5MIFvKvVaG5ZmJSUOA3+7ZDD6ro/jXHMfvXpQMNmX2VfxoqlWR6A9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781853590; c=relaxed/simple;
	bh=+88pK79ZKow9Fb9mNlK3YIEu6a/K2Bzmh7PdNNd4HV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ym/rLAjL0IcQPJ1KurF8Q3jk5bdKU5ZSkDmMQNgVfrPsBfr29HRv9rCC9R6KHZS/ZFoBdcycuSLSD+W+oOffoAm0DhJSy5HvLRt45PKLElvI1gVZu3qkPJ9/io1p+SV4XdBwlpsnJ65NgZLuuj5O/FRkK32DOKmYyVD9FB5eLWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKQ02m1S; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKQ02m1S"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30c00d41e91so118384eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Jun 2026 00:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781853589; cv=none;
        d=google.com; s=arc-20240605;
        b=N6W83WG5EjlKOYFl28a1hagyRlnpODVr2iHLEWJAD16rcXcaepCiBnmV7GuCUrNShV
         j7mA/LmJJLOD5XzSHzqHYl9Nt1zvv3kHD6gsXgC+BokDfGFlj9WbctYsUmQX+WzTAKsC
         CsTbSEcp6XHqIwci0mIwA5cAz1G2E6yUfoEBkQH65TbH4fbCkGGxxZP9xbOS4fAKfoQM
         vRuAHziFF7BrfYBHt3z7jNlTm3BmsA7HYQa3f/5g2ZS67zWW22fbTAoQcMxlswvRb25t
         K+EIO9n86lvxS6jDS4R4L6rLE8t3ynBLgK5sf+hh9rjgozqoBUHkx4FJ//fPgt/a/FTO
         YrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+88pK79ZKow9Fb9mNlK3YIEu6a/K2Bzmh7PdNNd4HV0=;
        fh=dcV46+KvERbmtUGNPmPX8fj3Pz3EtNwpYFkMwB5sFs8=;
        b=K7VbrRyloqD3p5VbjEiWfNGHHpdC/5n5FtROIKDosXVK56vCdsOOxRtwGkUXTQBtoS
         SS8UaXBLM5G8cKQuz6e14a1IandST/oI4xSVzYTJOEBFFftHukFChiB3NAGqQNgcPrwy
         UupgNJS7K0bhY3WJWEk6Xnd6M77j/nMdkTtkn1OQemdyQZnkeYzeHMPwRaZM4KA+5AHY
         vPjMQyDV9kkZev6z1mWBDV4hWjtg4LtUJj7Q7LQOEFdTg6Ot/uDzSsmuATcvB7aZ+eQD
         yUMXYwfgrpTniW/m2/UxeEzWFNLg1tHZTFwpwge1M/DBEHIGPaDb4DF2f4/YrbML/kba
         KO6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781853589; x=1782458389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+88pK79ZKow9Fb9mNlK3YIEu6a/K2Bzmh7PdNNd4HV0=;
        b=eKQ02m1Sq0SOnDgkLzDbAnMZBwm0XzXFwHJL7PwP7fzF8HoTl+pdrl1h16JPyU0KbV
         /2TnY4O9qU1U6AJmMmgU6hJVc56jWip+JZj73R5uXQm7Cr/2xzymbRGuY9gc2A+XQ01n
         5zAVIsNVedDFi6DAX6BYx3Ior3k3DUdxycvlrWNdjajfuseX+R4mc1RBOMk6+7A7P+8Q
         RsY3qYnvKH+MfhR7SG+frWECLfoMMARjG8EckplBNVeYxM9/8Fmm0c0fPIINSmS2f7g4
         r0sl9F6CrVusoG54fJwhlYBkTGwbCbHt0mLN7Z+V6ZHkRn95Jap2vPAS+mmJic5NpPL2
         m3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781853589; x=1782458389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+88pK79ZKow9Fb9mNlK3YIEu6a/K2Bzmh7PdNNd4HV0=;
        b=fSC+eIERcpeAVRNwBlKEp/c73YpeQkfG5aiS/QHXVUt0GZXlDTDEaOkahaz5eYioRh
         9/DreL+sW5u1aIIuwk+lwIEJKyGTbIGX86eCeyn8YmMESZyGtXZvXBCYL8FokJV/kpWe
         jlO+xk8OcWfw1jvhVaq9eyGtiEA3VJ/hCZnNdH5j4EhyQjT6EJJEjbLl8Y3r05mbRo8p
         qUO4W9W8NwBn5YuBmknSlYFmsPrwgSzCh253GNEY1MDRT10kkzMI12+HFfWhe9a8HJm4
         XWT3f9aFD6D+Jduv7x1tJCvNOinuLyCuvYtI4dMd/duVClUDZ6M6C2AzVq8kJyofgezH
         2o1w==
X-Forwarded-Encrypted: i=1; AFNElJ8in5NnLKjWNFeUQR0xkuowh3CADLZu2X6GFePRpjPoqjwpo0YoLr1LiZOozFx/ESRhXRdKUSpbe1C8dGf4Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC9mpPeF40OVgFahFONO5cwDhi8+7RqDbDbrXZi2sSU0B0YL90
	U23LSfQt7s22QbwTdV+JYIzQWmQvec/yvXfskvMnVCR141zCkL0bv0XPr6GPkaF+HiPUflN0ErC
	2ubBViWK/j3KHqB4Jp5ELOLKEtENKt8c=
X-Gm-Gg: AfdE7cmT+M15Kxvofh/uMQm/XtKhZmg9m2ltRLJTK3mIbmWdKTYSGw9V1CqfZYtHw22
	Ra5xiloAVY2mm4PpEoXbJjcYpztIuaM0Wfr34RyZMivyrFeyKwi7Scm2NqRRyQ0kBM/TR6gsX9f
	qGGTXW9OOR1XDXWymXiy+rdDN1dWTYncq5DNpzkR7R7BJbmxfqv4251jiCOcsRb2SCSNU4sUsHG
	TyaHwWOO7MSTYgdTuN6ODSaLWj2l3j07vMZed2Tj2yMdJB1TPVdg9XM4kM0zRD2cCkWuj4KnFHF
	67XAySETFoWLp05EwmHlZR0fv6acNQpe7KX9BFRP67tUEogeZraZr5fndQMG7jicQCNTmqWuslP
	CsiboRjiAztqS
X-Received: by 2002:a05:7300:5b89:b0:30b:6192:5b9 with SMTP id
 5a478bee46e88-30c0704c252mr782252eec.8.1781853588746; Fri, 19 Jun 2026
 00:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618095952.3687099-1-phasta@kernel.org> <20260618095952.3687099-4-phasta@kernel.org>
 <20260618181142.200117-1-work@onurozkan.dev> <c449f26e2283a2df6d5240879f85bee1b2fd4c50.camel@mailbox.org>
In-Reply-To: <c449f26e2283a2df6d5240879f85bee1b2fd4c50.camel@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 19 Jun 2026 09:19:36 +0200
X-Gm-Features: AVVi8CccBt9yDewoCAnVIMsVlxtHnVavxuQfjS-nEO1450uuf_IE5qGPi-jNBGI
Message-ID: <CANiq72=HzRRMNZcNfpZBPmefo=LJ2ckSk=gQS2=XjgnRQCkjRg@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: sync: Use safe synchronize_rcu() abstraction in poll
To: phasta@kernel.org
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lyude Paul <lyude@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 8:56=E2=80=AFAM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> Was already like that when I came here ;)
>
> But if it helps I can format it while I'm at it..

Yeah, we are trying to clean them as updates happen to them, i.e. to
avoid adding new ones in the old style.

Cheers,
Miguel

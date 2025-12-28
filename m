Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B911B2877F7
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766914829; cv=none; b=Fvbk0VFImFZGQiIWwC17VqNwOKG7v4KzjwjAmhjbC/e/cepbMt5M7lfLy8eRYTCKQLe3kcU278CHL6ebDiZIc7l9AziF5h9JarSeKTCzZEAas4T4dNq1e0G/Wr/2SnKCahoDELlGjU8gyiyVINFWKIkAgrBNGeYh8qLW3WthD80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766914829; c=relaxed/simple;
	bh=ueNW0F1G1ut2MU3nqKYHTYFpgwi8qA1Da6iYH4qpKv0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pcz++hYe2L+IO5+CIfllYUATpRtW7BlThkCzdn+4u+q2xyGVSu6frIl8iCt7njcvywVAdN6o+zvIhLuFmSld0gzX+i9stjCdB2quHdGUWF2rF2B4IV9B11kv8vXEnEQm+ospyh2gOSiozBKT8XleBnn9A6PgQOld7m54vt+eYKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U/Slp0zJ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U/Slp0zJ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d3ffa98fcso17661185e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 01:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766914826; x=1767519626; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aPVx+oix3V0cILnKS+kn1Vdq8t4fMf3pfpnQdXA/cBY=;
        b=U/Slp0zJBz/2+xbLT+GM9YsH0wg4NMiqPAFYsMzB3U6u0qop4N0lc6MXd3ILOO20oV
         wIdDHfe3rcqEVY4iBXBSQLHZNaqpI1lttMp93xgIajMhIAMxDYDLMUlIsQozA4OATAwE
         dL//iU+pOeiEi/Ltm5ROvqQOShnvRWPq+tVDJlkYgmTUbGA87oAWnBTI5rIXMRX4VB3Y
         lVivdPTmqr9MP+NqT58D+AoVzjo8lS3TIk/mtyybDuTr0cq0FOn0NIF2R9zq25SNI2EF
         3MBqMF1ijpvJ7n/t57NwMQhthQnqeSSd98qAG5JZENLAl6o80OidcxJWvbw08wt8PscA
         4x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766914826; x=1767519626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPVx+oix3V0cILnKS+kn1Vdq8t4fMf3pfpnQdXA/cBY=;
        b=cnfNFFMYyb5n1h5P9S4kxNn73qLSeQWBANsEQ7LQL/hs7O5CrlH5q7CWx4ptCDTm1U
         8xMz1BVC3I4vG9OLTckSB+MXsj3MPHoJubG6KO/83TNjCfkOFjWhr6MvW00errQ5/WmH
         Vq7jDgFLztzKaDI5tkTvyIrEA6LnPBzfjQ/zBGDSh3vTTUJIPkW+kYOzQLS8QUJ3hhKM
         9o4P3zZYPvXYkjzCbjoZBjcla5l12w8ya+w3VL5qteC9iqJJxhx/i/OG629etJePONq5
         G08SmHZ1G7Ac2ZTv9zLwuLgG1HWyF9IRjj2Aul4fkEkzBQvKjxTVVpHV4ofon6nfnzxQ
         CD3A==
X-Forwarded-Encrypted: i=1; AJvYcCWkHvqM+vHI6oA24N0VhEkeI5j2oluckSZotE7t04iYmibIW9Kk+N5NyPsMuIliY/EaZPsEE3m44Pccnr2kWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLIEJkoYAn9ElRtdez7vLnLPCWgopmMutgbZKB4WSoyO4Eh4WR
	Olz+plHyETBXlOu+Qk6WFCcd8MyhuboV8s317WiuudrFcKlR008sR0BTwTzF9H68gKMBduBNj5q
	FMiOQs4iuDbbgNBYmMA==
X-Google-Smtp-Source: AGHT+IGDlpCLEywC0R8/0xMfsTOk0hdmdgCr73r68IDO6sLyOlsykr8UvGVJo6al65GfvwZwnbY+OZhwjWGqxEo=
X-Received: from wmxa16-n2.prod.google.com ([2002:a05:600d:6450:20b0:477:79a7:7d7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8e:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-47d1957b120mr323178305e9.17.1766914826169;
 Sun, 28 Dec 2025 01:40:26 -0800 (PST)
Date: Sun, 28 Dec 2025 09:40:24 +0000
In-Reply-To: <20251226-add-entropy-v3-1-a3440823a07d@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251226-add-entropy-v3-1-a3440823a07d@google.com>
Message-ID: <aVD7CH6dHGH7-ETY@google.com>
Subject: Re: [PATCH v3] rust: Add support for feeding entropy to randomness pool
From: Alice Ryhl <aliceryhl@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Dec 26, 2025 at 07:15:10PM +0000, Matthew Maurer wrote:
> Adds just enough support to allow device drivers to feed entropy to the
> central pool.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Modulo doc suggestions from other reviews:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>


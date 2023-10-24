Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDE87461;
	Tue, 24 Oct 2023 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WE3J4Xtt"
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A83DD79;
	Tue, 24 Oct 2023 01:55:45 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5ac376d311aso17357387b3.1;
        Tue, 24 Oct 2023 01:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698137744; x=1698742544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLZGqz6UYX/ddgHmGp/3YSovbVZZCzUQK2Gy9MOvl2s=;
        b=WE3J4Xtt0lVjh1HpGOmoNmrYt0IRBfAvqwVgkLlQp1ihtWD3YT4C+P7Z+NZzhgU+7A
         ktrA/aSglVZSPl8HIjgBQJFMbu0/1DdPOwrUPSdGMN+5h39+cOaVwIGSHLdJquX93VpK
         Fgc/aPQlDySFcC2gJXU+/adC7KHeOi9iprK4QIzNh9BmQsj0ifvQg1sRtOEo+ufd3H3e
         9BzW9y+X6RayJHjwBgcMJnbCrvlqDcbNX2Y1cHZ+HSsHJDR6+lt5oc0rr7E8v3ua+w6K
         a3Wy033ULQuYOS1DIw6/ZKFFObCr4q5UPviz2Pt35fNuPQGFtxofJkYFHCKxQfR93NwK
         coug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698137744; x=1698742544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLZGqz6UYX/ddgHmGp/3YSovbVZZCzUQK2Gy9MOvl2s=;
        b=BiR1YZjKcGaBFClI4yXna7C2rYVPbiOfljkO+BMYgkf508L1x7b7I9ig2/W6jUcIu9
         3+c8R0jjPs+HRaqejyEwUAc0K59O+EkXWsLIwXehBOPjTJaLD2eLRAeTCwFmWsDKmcqf
         KMbV3ZRZUAn1YBEKGgWtgpY4YYrIFVcoWM4Q+NBxpnT7ZiwKp2AjWoxF9Zhptk/enURP
         ELuH4gG3mynjhU4q6EVK8AHTDw5bMGMghJ8CQaBVB64K2RcydXdEKjEhnlfpFrxkBa5r
         kMNiYH2tzHYwoT9u6w51Gy4gVfqEugH1/U5sw5VgFtmo2WaVknVCUJXa3q+sWhvWvbfi
         APMw==
X-Gm-Message-State: AOJu0YyAyucB4BFT+MGlpSui6TYDhb6ekujoRUdNf/0gp2SJTiMk5wCM
	rrCoyqn+3WZmaOiD4LgT5lIhtaAtJrp2TFe1Ei4=
X-Google-Smtp-Source: AGHT+IGG+PHV00fQVOh1xKFJBCV/fyXSVMUCW+/LlALS0zYopeOmD9HLQGdfyn9TCndvui+vGbcR/vNqzu3xWHKFtWg=
X-Received: by 2002:a81:7bd6:0:b0:598:5bb5:1801 with SMTP id
 w205-20020a817bd6000000b005985bb51801mr3460956ywc.50.1698137744345; Tue, 24
 Oct 2023 01:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231018160922.1018962-1-ojeda@kernel.org> <d47553f1-1832-4c69-8a8c-71c58048ff30@lunn.ch>
 <CANiq72=E7TPLcq-yiQF9E8a33ghbogPcbv-yMqFKBxMQ0oOxNQ@mail.gmail.com> <5c3f3ef8-e93c-49f1-881f-11c02afdaf7d@lunn.ch>
In-Reply-To: <5c3f3ef8-e93c-49f1-881f-11c02afdaf7d@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Oct 2023 10:55:33 +0200
Message-ID: <CANiq72k8Q8QCc+6azwah7ApFM5+7J0f4nWY3Rud1wqPOB0wP+A@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: add "The Rust experiment" section
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-doc@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 5:00=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> I've talked to a small number of netdev developers, not many, but
> some.

Thanks Andrew, this is valuable information (also for the upcoming
talk in netdevconf).

We have been putting some of the meta-information you mention in our
webpage instead, because it is easier to update (it is our `P:`
field). We will do our best to keep expanding it in the future.

Cheers,
Miguel

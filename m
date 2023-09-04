Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438091371
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Sep 2023 07:43:57 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5517DDF
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Sep 2023 00:43:56 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-401d2e11dacso11160135e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Sep 2023 00:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1693813435; x=1694418235; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ifvCGzYZ8dSBZT/icGjJJZKmlvecnEtAo9NWhhlJprI=;
        b=RabA6zB5XWUowHX1AjzAjs540jWwnl4p4lOjBVrQMlJ8zwFCvogTdDDJU3yRMd0KBc
         51GDkir9qjszlZdx99wMIs7soG9jSUM8npo5KebAeFSYVxUs07saSag/+L4Q99Q1Iz8b
         GEVn1l8q1mYgQK0ZqOl8J262GgSG8VJl1Qknyz0vcvOZUYl880inS+dHn2ZtFx3GoQz7
         GEUYjv0/yH+2QKU3uRI9EI+9do+kF/w4RG5lu+aWaYmbOBbSx7qtcjeFlogjbapXx1P2
         1mmiUlmr+4p/IirA5BSlW4TD4A0TJjCzjK+JoEzyKTmQdSkbTh2C5N28XNcylxIzWiI/
         XCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693813435; x=1694418235;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifvCGzYZ8dSBZT/icGjJJZKmlvecnEtAo9NWhhlJprI=;
        b=VeVWXuX+WGST+es5w4NdOJ4nBtHwJ+SayrfBCgyEMr5XkO6Qx7clxa3+qNd3/YR52o
         4pwz7NPps9w524AhjPtGykXRAgQ40E0TvU8S68/m/NMhr15im4BLtyMAIqqHcXrQwnkU
         weON9lCSr+S7Aohavv6+pyFDA953xaQB96QayeVyBe6/BgxIq2N0QjoiGMHJPFkKyk6t
         39SomUml/VYi96kYDzjz9Bi229UDz20WL2gSs76mB0e2GyoWbidipxh6mDcZoYKErbBO
         FlkzD4zASHU3gtcsOM60w9yd2Jdcf2S8ppTs+OH6KqzvtY2iU9WJTqSl5rmcscFOPjfg
         wc/w==
X-Gm-Message-State: AOJu0YyF4O/jXV4PFEAN/fpPbQN0cbpv9OCIjzccsa33mtMqHkC/nTqa
	isrrJOt3ph+7ETAudDyE1ZhVhw==
X-Google-Smtp-Source: AGHT+IF/VhmH8vxSF24dGvyU92yKMeU6tMOo/g5hatDiNDqzAh+m4v5n+Mvz8VKgYQUMhVlad5G9Gw==
X-Received: by 2002:adf:f291:0:b0:313:e88d:e6d3 with SMTP id k17-20020adff291000000b00313e88de6d3mr8760640wro.14.1693813434681;
        Mon, 04 Sep 2023 00:43:54 -0700 (PDT)
Received: from localhost ([147.161.155.99])
        by smtp.gmail.com with ESMTPSA id f9-20020adff989000000b00319756d5b80sm13912160wrr.29.2023.09.04.00.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 00:43:54 -0700 (PDT)
References: <20230830165949.127475-1-ojeda@kernel.org>
User-agent: mu4e 1.10.5; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
Subject: Re: [PATCH 1/2] MAINTAINERS: update Rust webpage
Date: Mon, 04 Sep 2023 09:43:37 +0200
In-reply-to: <20230830165949.127475-1-ojeda@kernel.org>
Message-ID: <87pm2ytmbq.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


Miguel Ojeda <ojeda@kernel.org> writes:

> A few months ago we started a webpage for the Rust subsystem and
> the overall Rust for Linux project [1].
>
> The current `W:` field of the Rust entry points to the GitHub
> repository, since originally we kept information in a `README.md`
> file that got rendered by GitHub when visiting that URL.
>
> That information was moved into the webpage and got expanded.
> The webpage is also nowadays the entry point to the project,
> and we pointed the "Website" GitHub metadata field to it.
>
> Thus update the `W:` field to point to the actual webpage.
>
> Link: https://rust-for-linux.com [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>


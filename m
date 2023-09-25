Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B38E7489
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 15:43:32 +0000 (UTC)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CED41989
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 08:43:03 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d81adf0d57fso7876017276.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 08:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695656582; x=1696261382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wv8hDBe33rGskYGv0VBbFklyzA8uuz3o3ss9p741Ybk=;
        b=CsS7/jROYeZtJtHumXRWObxAfdhqnCbM2LQ+ViA51TvWtwJMN+sK5UF2Z67ppZMhnP
         gU0wPpIJ6BNupBz9jRNzt4HchbILnHmC/geV3aQu2AtT4Eyb9Xe5uXBDD9/zcR1G00xB
         Qf6U9AAg/l5PjuRz9pgcBSUAwB6kARYsdirYMEFrGVaGykoNBbXlWGjyKfXEYeaerhMo
         OrzNkHp7auoy7JJHxO3QzY2/rwin6OPyQBC9HdoFZgniHIVpIJzAaWV/Tg57g1ILWtwl
         5eleB7IoCWAIS9KazzDc6yH15K8IiMRwj4P3bdd0rFg1Gbulrmd1KsGy+uVrbEHFP96e
         08ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656582; x=1696261382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wv8hDBe33rGskYGv0VBbFklyzA8uuz3o3ss9p741Ybk=;
        b=NdN7u3Fn4wi6/tiOManlvaZUbg2QGOkT5zH3pbazzlDPWjuXFmncjHRQBvN9VwzSej
         VjE4NvM6hH3QQ6iYqXS6Z7rCd8xozKRiRBK7REKjg9UbxW45/SEVSu8jXYbuKt7HqDos
         7XRJe7SMrrQI5waTDYLth2ONk5sDl5SIotHeOkgIVNbfYTMOlMC+/wHkKyA8mTPLcYQN
         6dfMtOa3SY0l9+kmHOQfvjdZ6YCk90NB2tUewycYzoCvq3N1rdSfW6TvxVEdMH6M7azK
         7uZ2VJZpJDAKLIT1LZU+zUxP5iw62zPMuD4f4EiCyB03EH7Ow9zk5rLtawh4c417Ym7Y
         1siw==
X-Gm-Message-State: AOJu0YyH5oDQOgpf1ZvA1EoXq9j3CmrJY1Fm3CxmicJ0PiJThO7o5VSU
	g1NAkonrV8uELu0pH+yMl/81ou1dCK7Cpy+b4HI=
X-Google-Smtp-Source: AGHT+IESB3sh3SBLsE3wJYVRTysggDWN9jObQaLnAGkaaN4GcEZcuGg6QYolBODmwXto1KXMTXG4Hcg7vF6nvbQheP4=
X-Received: by 2002:a5b:54b:0:b0:d06:f99e:6345 with SMTP id
 r11-20020a5b054b000000b00d06f99e6345mr5426472ybp.22.1695656582391; Mon, 25
 Sep 2023 08:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com> <97600770-f800-473a-af5c-870d4f8ce152@lunn.ch>
 <CANiq72mQ6NWr=t=eCcr11oO6kEyZ-45=h27fiUBdVU7xZw9NWQ@mail.gmail.com> <da479834-a649-4a93-9083-9ea59d519cbd@lunn.ch>
In-Reply-To: <da479834-a649-4a93-9083-9ea59d519cbd@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Sep 2023 17:42:51 +0200
Message-ID: <CANiq72nB+7P8Pby-_Vxq0Fq_g0L8tC2XG6UT-T4kPqhMnKqLnQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 25, 2023 at 3:43=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> I think the end goal should be that if there is no Rust PHY driver
> module loaded, the Rust PHY abstraction should also not be loaded. I

Agreed, that is the goal.

> think best practice would also be, if the kernel configuration does
> not contain a Rust PHY driver, don't even build the Rust PHY
> abstraction.

I am not sure about this one: a user may want to have abstractions
built-in but the drivers as loadable modules. One also needs to
consider out-of-tree modules even if we know everything that got built
as a module in-tree.

> This 'always built-in' is the issues i was trying to point to. phylib

Yeah, we are aware of the limitation. This was another consequence of
the way we had to build things in a simple way given Kbuild does not
map well to Rust, and thus the need for the new build system.

Cheers,
Miguel
